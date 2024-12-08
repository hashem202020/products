//
//  AppCoordinator.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import UIKit
import SwiftUI

final class AppCoordinator: Coordinator {
    private var navigationController: UINavigationController
    private let productsListDependencyContainer: ProductsListDependencyContainer
    
    init(navigationController: UINavigationController,
         productsListDependencyContainer: ProductsListDependencyContainer) {
        self.navigationController = navigationController
        self.productsListDependencyContainer = productsListDependencyContainer
        setupNavigationBarAppearance()
    }
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.shadowColor = .clear

        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
    }

    func start() {
        let productsListView = productsListDependencyContainer.makeProductsListView(navigationController: navigationController)
        navigationController.setViewControllers([productsListView], animated: true)
    }
}
