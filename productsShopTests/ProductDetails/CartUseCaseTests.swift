//
//  productsShopTests.swift
//  productsShopTests
//
//  Created by Khaled hashem on 07/12/2024.
//

import XCTest
@testable import productsShop

class DefaultCartUseCaseTests: XCTestCase {
    var useCase: DefaultCartUseCase!
    var mockRepository: MockCartRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockCartRepository()
        useCase = DefaultCartUseCase(repository: mockRepository)
    }

    override func tearDown() {
        mockRepository = nil
        useCase = nil
        super.tearDown()
    }

    func testAddProductToCart() {
        let productId = 1
        
        // Add product to cart
        let cartCount = useCase.addOrRemoveProduct(productId: productId)
        
        // Verify the product is added
        XCTAssertTrue(mockRepository.isProductInCart(productId: productId))
        XCTAssertEqual(cartCount, 1)
    }

    func testRemoveProductFromCart() {
        let productId = 1
        
        // Add the product first
        mockRepository.addProduct(productId: productId)
        
        // Remove product from cart
        let cartCount = useCase.addOrRemoveProduct(productId: productId)
        
        // Verify the product is removed
        XCTAssertFalse(mockRepository.isProductInCart(productId: productId))
        XCTAssertEqual(cartCount, 0)
    }

    func testToggleProductInCart() {
        let productId = 1
        
        // Initially add the product
        var cartCount = useCase.addOrRemoveProduct(productId: productId)
        XCTAssertTrue(mockRepository.isProductInCart(productId: productId))
        XCTAssertEqual(cartCount, 1)

        // Toggle to remove the product
        cartCount = useCase.addOrRemoveProduct(productId: productId)
        XCTAssertFalse(mockRepository.isProductInCart(productId: productId))
        XCTAssertEqual(cartCount, 0)
    }
    
    func testGetCartCount() {
        let productId1 = 1
        let productId2 = 2
        
        // Add products to the cart
        mockRepository.addProduct(productId: productId1)
        mockRepository.addProduct(productId: productId2)
        
        // Verify cart count
        XCTAssertEqual(mockRepository.getCartCount(), 2)
        
        // Remove one product
        mockRepository.removeProduct(productId: productId1)
        
        // Verify updated cart count
        XCTAssertEqual(mockRepository.getCartCount(), 1)
    }
}
