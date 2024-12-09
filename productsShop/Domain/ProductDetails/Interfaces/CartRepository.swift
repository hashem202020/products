//
//  CartRepository.swift
//  productsShop
//
//  Created by Khaled hashem on 09/12/2024.
//

public protocol CartRepository {
    func isProductInCart(productId: Int) -> Bool
    func addProduct(productId: Int)
    func removeProduct(productId: Int)
    func getCartCount() -> Int
}
