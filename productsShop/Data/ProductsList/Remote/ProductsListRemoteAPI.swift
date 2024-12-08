//
//  ProductsListRemoteAPI.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

public protocol ProductsListRemoteAPI: RemoteAPI {
    func fetchProductsList() async throws -> [ProductDTO]
}

public final class DefaultProductsListRemoteAPI: ProductsListRemoteAPI {
    public func fetchProductsList() async throws -> [ProductDTO] {
        try await request(endPoint: "productBundles", method: .get)
    }
}
