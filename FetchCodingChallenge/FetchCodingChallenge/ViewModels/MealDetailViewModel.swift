//
//  MealDetailViewModel.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import Foundation
import Combine

final class MealDetailViewModel: ObservableObject {
    
    @Published var dessert: DessertDetail?
    let mealDbRepo = MealDbRepo()
    
    init(_ mealId: String?) {
        getDessert(for: mealId)
    }
    
    private func getDessert(for mealId: String?) {
        mealDbRepo.fetchDessertDetail(for: mealId) { [weak self] result in
            switch result {
            case .success(let recipe):
                self?.dessert = recipe
            case .failure(let error):
                print("Failed to fetch dessert list: \(error)")
            }
        }
    }
    
    func getMealName() -> String {
        return dessert?.name ?? "N/A"
    }
    
    func getInstructions() -> String {
        guard let instructions = dessert?.instructions else { return "N/A"}
        
        return instructions.replacingOccurrences(of: "\r\n", with: "\n\n").replacingOccurrences(of: "\n\n\n", with: "\n\n")
    }
    
    func getIngredients() -> [String] {
        guard let dessert = dessert else { return [] }
        return dessert.ingredients
    }
    
    func getMeasurements() -> [String] {
        guard let dessert = dessert else { return [] }
        return dessert.measurements
    }
}
