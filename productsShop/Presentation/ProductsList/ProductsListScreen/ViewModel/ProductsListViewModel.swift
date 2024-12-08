//
//  ProductsListViewModel.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import Foundation

final class ProductsListViewModel: ObservableObject {
    private let getProductsListUseCase: GetProductsListUseCase
    
    @Published var products: [ProductPresentationModel] = []
    
    init(getProductsListUseCase: GetProductsListUseCase) {
        self.getProductsListUseCase = getProductsListUseCase
        loadProducts()
    }
    
    func loadProducts() {
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
}
