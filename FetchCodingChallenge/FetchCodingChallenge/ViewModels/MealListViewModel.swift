//
//  MealListViewModel.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import Foundation
import Combine

final class MealListViewModel: ObservableObject {
    @Published private var meals: [Dessert] = []
    private let mealDbRepo = MealDbRepo()
    
    init() {
        getMealList()
    }
    
    private func getMealList() {
        mealDbRepo.fetchDessertList { [weak self] result in
            switch result {
            case .success(let meals):
                self?.meals = meals
            case .failure(let error):
                print("Failed to fetch dessert list: \(error)")
            }
        }
    }
    
    func getMeal(at index: Int) -> Dessert? {
        guard index < getMealCount() else { return nil }
        return meals[index]
    }
    
    func getMealCount() -> Int {
        return meals.count
    }
}
