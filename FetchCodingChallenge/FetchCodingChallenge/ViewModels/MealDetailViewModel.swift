//
//  MealDetailViewModel.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import Foundation
import Combine

final class MealDetailViewModel: ObservableObject {
    @Published private var meal: DessertDetail?
    let mealDbRepo = MealDbRepo()
    
    init(_ mealId: String?) {
        getMealDetail(for: mealId)
    }
    
    private func getMealDetail(for mealId: String?) {
        mealDbRepo.fetchDessertDetail(for: mealId) { [weak self] result in
            switch result {
            case .success(let recipe):
                self?.meal = recipe
            case .failure(let error):
                print("Failed to fetch dessert list: \(error)")
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
