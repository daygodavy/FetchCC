//
//  MealDbRepo.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/13/23.
//

import Foundation
import Combine

enum MealDbEndpoint: String {
    case dessertList = "filter.php?c=Dessert"
    case dessertDetail = "lookup.php?i="
}

final class MealDbRepo {
    
    private let baseURL = "https://themealdb.com/api/json/v1/1/"
    private let networkManager = NetworkManager()
    private var cancellables: Set<AnyCancellable> = []

    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
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
