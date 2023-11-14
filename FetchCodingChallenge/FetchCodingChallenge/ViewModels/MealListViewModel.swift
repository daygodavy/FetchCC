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
    private let mealDbRepo = MealDbRepo()
    
    init() {
        getDessertList()
    }
    
    private func getDessertList() {
        mealDbRepo.fetchDessertList { [weak self] result in
            switch result {
            case .success(let desserts):
                self?.desserts = desserts
            case .failure(let error):
                print("Failed to fetch dessert list: \(error)")
            }
        }
    }
    
    func getDessert(at index: Int) -> Dessert? {
        guard index < getDessertCount() else { return nil }
        return desserts[index]
    }
    
    func getDessertCount() -> Int {
        return desserts.count
    }
}
