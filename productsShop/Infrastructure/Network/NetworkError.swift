//
//  NetworkError.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

enum NetworkError: Error {
    case invalidResponse
    case requestFailed(Error)
    case decodingFailed(Error)
}
