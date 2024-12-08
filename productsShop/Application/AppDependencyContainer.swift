//
//  AppDependencyContainer.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import Foundation

class AppDependencyContainer {
    var productsListDependencyContainer: ProductsListDependencyContainer {
        DefaultProductsListDependencyContainer()
    }
    
}
