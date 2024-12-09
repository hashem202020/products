//
//  ProductsListViewModel.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import Foundation

final class ProductsListViewModel: ObservableObject {
    private let getProductsListUseCase: GetProductsListUseCase
    private let productsListCoordinator: ProductsListCoordinator
    @Published var products: [ProductPresentationModel] = []
    
    init(getProductsListUseCase: GetProductsListUseCase,
         productsListCoordinator: ProductsListCoordinator) {
        self.getProductsListUseCase = getProductsListUseCase
        self.productsListCoordinator = productsListCoordinator
        loadProducts()
    }
    
    private func loadProducts() {
        Task {
            do {
               let result = try await getProductsListUseCase.execute()
                await MainActor.run {
                    products = result.map(ProductPresentationModel.init)
                }
            } catch let error {
                print(error)
            }
        }
    }
    
    func openDetails(product: ProductPresentationModel) {
        productsListCoordinator.openProductDetails(with: product)
    }
    
}
