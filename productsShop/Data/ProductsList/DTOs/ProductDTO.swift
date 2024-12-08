//
//  ProductDTO.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

public struct ProductDTO: Codable {
    let id: Int
    let name: String?
    let description: String?
    let price: Float?
    let currencyCode: String?
    let currencySymbol: String?
    let quantity: Int?
    let imageLocation: String?
    let status: String?
    
    func toDomainModel() -> Product {
        Product(id: id,
                name: name ?? "",
                description: description ?? "",
                price: price ?? 0,
                currencyCode: currencyCode ?? "",
                currencySymbol: currencySymbol ?? "",
                quantity: quantity ?? 0,
                imageLocation: imageLocation ?? "",
                status: status)
    }
}
