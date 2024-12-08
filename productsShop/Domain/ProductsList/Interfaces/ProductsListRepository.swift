//
//  ProductsListRepository.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

public protocol ProductsListRepository {
    func fetchProductsList() async throws -> [Product]
}
