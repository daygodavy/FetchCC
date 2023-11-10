//
//  MealListViewModel.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import Foundation
import Combine

final class MealListViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchDessertList() {
        let dessertListEndpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        NetworkManager.shared.fetchData(from: dessertListEndpoint, modelType: DessertList.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    // Update UI
                    break
                case .failure(let error):
                    print("Failed to fetch dessert list: \(error)")
                }
    
            }, receiveValue: { [weak self] dessertList in
                self?.desserts = dessertList.meals
            })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
