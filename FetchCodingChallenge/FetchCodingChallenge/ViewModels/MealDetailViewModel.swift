//
//  MealDetailViewModel.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import Foundation
import Combine

/*
 MealDetailViewModel is the view model class that
 is responsible for all the data that is
 displayed within the MealDetailView
 */
final class MealDetailViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published private var meal: DessertDetail?
    @Published var error: Error?
    private let mealDbRepo = MealDbRepo()
    
    // MARK: - Initializer
    init(_ mealId: String?) {
        getMealDetail(for: mealId)
    }
    
    // MARK: - Methods
    /// Uses MealDbRepo to retrieve dessert details data for the view
    private func getMealDetail(for mealId: String?) {
        mealDbRepo.fetchDessertDetail(for: mealId) { [weak self] result in
            switch result {
            case .success(let recipe):
                self?.meal = recipe
            case .failure(let error):
                self?.error = error
                print("Failed to fetch dessert details: \(error)")
            }
        }
    }
    
    func getMealName() -> String {
        return meal?.name ?? "N/A"
    }
    
    func getInstructions() -> String {
        guard let instructions = meal?.instructions else { return "N/A"}
        
        return instructions.replacingOccurrences(of: "\r\n", with: "\n\n").replacingOccurrences(of: "\n\n\n", with: "\n\n")
    }
    
    func getIngredients() -> [String] {
        guard let meal = meal else { return [] }
        return meal.ingredients
    }
    
    func getMeasurements() -> [String] {
        guard let meal = meal else { return [] }
        return meal.measurements
    }
    
    func getMealImageStr() -> String?  {
        guard let meal = meal else { return nil }
        return meal.imageLink
    }
}
