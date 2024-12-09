//
//  ProductDetailsViewModel.swift
//  productsShop
//
//  Created by Khaled hashem on 09/12/2024.
//

import Foundation
final class ProductDetailsViewModel: ObservableObject {
    private let cartUseCase: CartUseCase
    var productDetails: ProductPresentationModel
    
    @Published var cartCount: Int?
    
    var addToCartText: String {
        return cartUseCase.isProductInCart(productId: productDetails.id) ? "Remove from cart" : "Add to cart"
    }

    init(productDetails: ProductPresentationModel,
         cartUseCase: CartUseCase) {
        self.productDetails = productDetails
        self.cartUseCase = cartUseCase
        cartCount = cartUseCase.getCartCount()
    }
    
    func toggleProductInCart() {
        cartCount = cartUseCase.addOrRemoveProduct(productId: productDetails.id)
    }
}
