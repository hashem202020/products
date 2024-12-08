//
//  ProductsListDependencyContainer.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import SwiftUI

protocol ProductsListDependencyContainer {
    func makeProductsListView(navigationController: UINavigationController) -> UIHostingController<ProductsListView>
}

final class DefaultProductsListDependencyContainer: ProductsListDependencyContainer {
    
    func makeProductsListView(navigationController: UINavigationController) -> UIHostingController<ProductsListView> {
        let viewModel = makeProductsListViewModel(navigationController: navigationController)
        return UIHostingController(rootView: ProductsListView(viewModel: viewModel))
    }
    
    private func makeProductsListViewModel(navigationController: UINavigationController) -> ProductsListViewModel {
        return ProductsListViewModel(getProductsListUseCase: makeGetProductsListUseCase())
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
}
