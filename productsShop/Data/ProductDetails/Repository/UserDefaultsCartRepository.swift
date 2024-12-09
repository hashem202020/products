//
//  UserDefaultsCartRepository.swift
//  productsShop
//
//  Created by Khaled hashem on 09/12/2024.
//

import Foundation
class UserDefaultsCartRepository: CartRepository {
    private let cartKey = "CartProducts"
    func isProductInCart(productId: Int) -> Bool {
        guard let storedProducts = UserDefaults.standard.array(forKey: cartKey) as? [Int] else {
            return false
        }
        return storedProducts.contains(productId)
    }

    func addProduct(productId: Int) {
        var storedProducts = UserDefaults.standard.array(forKey: cartKey) as? [Int] ?? []
        storedProducts.append(productId)
        UserDefaults.standard.setValue(storedProducts, forKey: cartKey)
    }

    func removeProduct(productId: Int) {
        var storedProducts = UserDefaults.standard.array(forKey: cartKey) as? [Int] ?? []
        storedProducts.removeAll { $0 == productId }
        UserDefaults.standard.setValue(storedProducts, forKey: cartKey)
    }

    func getCartCount() -> Int {
        return UserDefaults.standard.array(forKey: cartKey)?.count ?? 0
    }

}
