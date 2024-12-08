//
//  RemoteAPI.swift
//  productsShop
//
//  Created by Khaled hashem on 07/12/2024.
//

import Foundation

public protocol RemoteAPI {
    func request<T: Codable>(endPoint: String, method: HTTPMethod) async throws -> T
}

extension RemoteAPI {
    public func request<T: Codable>(endPoint: String, method: HTTPMethod) async throws -> T {
        
        let baseUrl = Bundle.main.infoDictionary?[NetworkConstants.apiBaseURL] as? String ?? ""
        guard let url = URL(string: "\(baseUrl)\(endPoint)") else {
            throw NetworkError.invalidResponse
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch let decodingError as DecodingError {
            throw NetworkError.decodingFailed(decodingError)
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
