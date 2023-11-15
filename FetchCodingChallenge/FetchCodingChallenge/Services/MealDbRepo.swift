//
//  MealDbRepo.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/13/23.
//

import Foundation
import Combine

/// Specifies endpoint following base URL
enum MealDbEndpoint: String {
    case dessertList = "filter.php?c=Dessert"
    case dessertDetail = "lookup.php?i="
}

/*
 MealDbRepo handles communication with NetworkManager to retrieve
 data from TheMealDb endpoint and provides that data to the view models
 */
final class MealDbRepo {
    
    // MARK: - Variables
    private let baseURL = "https://themealdb.com/api/json/v1/1/"
    private let networkManager = NetworkManager()
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Deinitalizing
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    // MARK: - Methods
    /// Fetches all dessert items from TheMealDb via NetworkManager
    func fetchDessertList(completion: @escaping (Result<[Dessert], Error>) -> Void) {
        let endpoint = baseURL + MealDbEndpoint.dessertList.rawValue
        
        networkManager.fetchData(from: endpoint, modelType: DessertList.self)
            .sink(receiveCompletion: { result in
                if case let .failure(error) = result {
                    completion(.failure(error))
                }
            }, receiveValue: { dessertList in
                completion(.success(dessertList.meals))
            })
            .store(in: &cancellables)
    }
    
    /// Fetches details for selected dessert item from TheMealDb via NetworkManager
    func fetchDessertDetail(for id: String?, completion: @escaping (Result<DessertDetail, Error>) -> Void) {
        guard let id = id else { return }
        let endpoint = baseURL + MealDbEndpoint.dessertDetail.rawValue + id
        
        networkManager.fetchData(from: endpoint, modelType: DessertDetailResponse.self)
            .sink(receiveCompletion: { result in
                if case let .failure(error) = result {
                    completion(.failure(error))
                }
            }, receiveValue: { dessertDetailResponse in
                if let recipe = dessertDetailResponse.meals.first {
                    completion(.success(recipe))
                }
            })
            .store(in: &cancellables)
    }
}
