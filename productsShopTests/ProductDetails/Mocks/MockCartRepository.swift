//
//  MockCartRepository.swift
//  productsShopTests
//
//  Created by Khaled hashem on 09/12/2024.
//

@testable import productsShop
class MockCartRepository: CartRepository {
    private var productsInCart: [Int] = []

    func isProductInCart(productId: Int) -> Bool {
        return productsInCart.contains(productId)
    }

    func addProduct(productId: Int) {
        productsInCart.append(productId)
    }

    func removeProduct(productId: Int) {
        productsInCart.removeAll { $0 == productId }
    }

    func getCartCount() -> Int {
        return productsInCart.count
    }
}
