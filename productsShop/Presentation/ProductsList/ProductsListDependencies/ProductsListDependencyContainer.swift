//
//  ProductsListDependencyContainer.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import SwiftUI

protocol ProductsListDependencyContainer {
    func makeProductsListView(navigationController: UINavigationController) -> UIHostingController<ProductsListView>
    func makeProductDetailsView(product: ProductPresentationModel) -> UIHostingController<ProductDetailsView>
}

final class DefaultProductsListDependencyContainer: ProductsListDependencyContainer {
    // MARK: - Products List
    func makeProductsListView(navigationController: UINavigationController) -> UIHostingController<ProductsListView> {
        let viewModel = makeProductsListViewModel(navigationController: navigationController)
        return UIHostingController(rootView: ProductsListView(viewModel: viewModel))
    }
    
    private func makeProductsListViewModel(navigationController: UINavigationController) -> ProductsListViewModel {
        return ProductsListViewModel(getProductsListUseCase: makeGetProductsListUseCase(),
                                     productsListCoordinator: makeProductsListCoordinator(navigationController: navigationController))
    }
    
    private func makeGetProductsListUseCase() -> GetProductsListUseCase {
        DefaultGetProductsListUseCase(productsListRepository: makeProductsListRepository())
    }
    
    private func makeProductsListRepository() -> ProductsListRepository {
        DefaultProductListRepository(productsListRemoteAPI: makeProductsListRemoteAPI())
    }
    
    private func makeProductsListRemoteAPI() -> ProductsListRemoteAPI {
        DefaultProductsListRemoteAPI()
    }
    
    private func makeProductsListCoordinator(navigationController: UINavigationController) -> ProductsListCoordinator {
        DefaultProductsListCoordinator(
            navigationController: navigationController,
            productsListDependencyContainer: self)
    }
    
    // MARK: - Products Details
    func makeProductDetailsView(product: ProductPresentationModel) -> UIHostingController<ProductDetailsView> {
        let viewModel = makeProductDetailsViewModel(product: product)
        return UIHostingController(rootView: ProductDetailsView(viewModel: viewModel))
    }
    
    private func makeProductDetailsViewModel(product: ProductPresentationModel) -> ProductDetailsViewModel {
        ProductDetailsViewModel(productDetails: product,
                                cartUseCase: makeCartUseCase())
    }
    
    private func makeCartUseCase() -> CartUseCase {
        DefaultCartUseCase(repository: makeCartRepository())
    }
    
    private func makeCartRepository() -> CartRepository {
        UserDefaultsCartRepository()
    }
}
