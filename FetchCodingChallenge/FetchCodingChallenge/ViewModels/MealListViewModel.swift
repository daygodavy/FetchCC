//
//  MealListViewModel.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import Foundation
import Combine

/*
 MealListViewModel is the view model class that
 is responsible for all the data that is
 displayed within the MealListView
 */
final class MealListViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published private var meals: [Dessert] = []
    @Published var error: Error?
    private let mealDbRepo = MealDbRepo()
    
    // MARK: - Initializer
    init() {
        getMealList()
    }
    
    // MARK: - Methods
    /// Uses MealDbRepo to retrieve dessert list data for the view
    private func getMealList() {
        mealDbRepo.fetchDessertList { [weak self] result in
            switch result {
            case .success(let meals):
                self?.meals = meals
            case .failure(let error):
                self?.error = error
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
