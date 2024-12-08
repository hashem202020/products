//
//  ProductPresentationModel.swift
//  productsShop
//
//  Created by Khaled hashem on 09/12/2024.
//

public struct ProductPresentationModel: Identifiable {
    public let id: Int
    let name: String
    let description: String
    let price: String
    let currencyCode: String
    let currencySymbol: String
    let quantity: Int
    let imageLocation: String
    let status: String?
    
    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.description = product.description
        self.price = String(format: "%.2f", product.price)
        self.currencyCode = product.currencyCode
        self.currencySymbol = product.currencySymbol
        self.quantity = product.quantity
        self.imageLocation = product.imageLocation
        self.status = product.status
    }
}
