//
//  GetProductsListUseCase.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

public protocol GetProductsListUseCase {
    func execute() async throws -> [Product]
}

final public class DefaultGetProductsListUseCase: GetProductsListUseCase {
    let productsListRepository: ProductsListRepository
    
    init(productsListRepository: ProductsListRepository) {
        self.productsListRepository = productsListRepository
    }
    public func execute() async throws -> [Product] {
        try await productsListRepository.fetchProductsList()
    }
    
}

