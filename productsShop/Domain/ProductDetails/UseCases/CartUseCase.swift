//
//  CartUseCase.swift
//  productsShop
//
//  Created by Khaled hashem on 09/12/2024.
//

protocol CartUseCase {
    func addOrRemoveProduct(productId: Int) -> Int
    func isProductInCart(productId: Int) -> Bool
    func getCartCount() -> Int
}

class DefaultCartUseCase: CartUseCase {
    private let repository: CartRepository

    init(repository: CartRepository) {
        self.repository = repository
    }

    func addOrRemoveProduct(productId: Int) -> Int {
        if repository.isProductInCart(productId: productId) {
            repository.removeProduct(productId: productId)
        } else {
            repository.addProduct(productId: productId)
        }
        return repository.getCartCount()
    }
    
    func isProductInCart(productId: Int) -> Bool {
        repository.isProductInCart(productId: productId)
    }
    
    func getCartCount() -> Int {
        repository.getCartCount()
    }
}
