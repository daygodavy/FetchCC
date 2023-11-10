//
//  NetworkManager.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//


import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData<T: Decodable>(from endpoint: String, modelType: T.Type) -> AnyPublisher<T, Error> {
        guard let url = URL(string: endpoint) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode)
                else { throw NetworkError.invalidResponse }
                
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkError.decodingError
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case invalidResponse
    case decodingError
    // Add more error cases as needed
}



//import Foundation
//
//class NetworkManager {
//    
//    static let shared = NetworkManager()
//    
//    func fetchData<T: Decodable>(from endpoint: String, modelType: T.Type) async throws -> T {
//        guard let url = URL(string: endpoint) else {
//            throw NetworkError.invalidURL
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        // If you need to check the response status code, you can cast the response to HTTPURLResponse
//        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//            throw NetworkError.invalidResponse
//        }
//        
//        let decoder = JSONDecoder()
//        let model = try decoder.decode(T.self, from: data)
//        return model
//    }
//}
//
//enum NetworkError: Error {
//    case invalidURL
//    case noData
//    case invalidResponse
//    // Add more error cases as needed
//}
