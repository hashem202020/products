//
//  DefaultProductListRepository.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

public final class DefaultProductListRepository: ProductsListRepository {
    // MARK: - Properties
    private let productsListRemoteAPI: ProductsListRemoteAPI
    
    // MARK: - Methods
    init(productsListRemoteAPI: ProductsListRemoteAPI) {
        self.productsListRemoteAPI = productsListRemoteAPI
    }
    
    public func fetchProductsList() async throws -> [Product] {
        let response = try await productsListRemoteAPI.fetchProductsList()
        let products = response.map({$0.toDomainModel()})
        return products
    }
}
