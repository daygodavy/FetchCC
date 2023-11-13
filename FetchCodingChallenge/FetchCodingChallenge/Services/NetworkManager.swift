//
//  NetworkManager.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//


import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case noData
    case invalidResponse
    case decodingError
}

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
