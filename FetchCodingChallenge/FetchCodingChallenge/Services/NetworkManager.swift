//
//  NetworkManager.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//


import Foundation
import Combine

/*
 NetworkManager handles network calls and decoding JSON responses
 */
class NetworkManager {
    
    // MARK: - Variables
    let decoder = JSONDecoder()
    
    // MARK: - Methods
    func fetchData<T: Decodable>(from endpoint: String, modelType: T.Type) -> AnyPublisher<T, Error> {
        guard let url = URL(string: endpoint) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else { throw NetworkError.invalidResponse }
                
                do {
                    return try self.decoder.decode(T.self, from: data)
                } catch {
                    throw NetworkError.invalidData
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
