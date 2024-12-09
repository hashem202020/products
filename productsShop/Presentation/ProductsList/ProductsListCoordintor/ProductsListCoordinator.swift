//
//  ProductsListCoordinator.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import UIKit

protocol ProductsListCoordinator {
    func openProductDetails(with product: ProductPresentationModel)
}

final class DefaultProductsListCoordinator: ProductsListCoordinator {
    private var navigationController: UINavigationController
    private let productsListDependencyContainer: ProductsListDependencyContainer
    
    init(navigationController: UINavigationController,
         productsListDependencyContainer: ProductsListDependencyContainer) {
        self.navigationController = navigationController
        self.productsListDependencyContainer = productsListDependencyContainer
    }
    
    func openProductDetails(with product: ProductPresentationModel) {
        let productDetailsView = productsListDependencyContainer.makeProductDetailsView(product: product)
        navigationController.pushViewController(productDetailsView, animated: true)
    }
}
