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
    private var cancellables: Set<AnyCancellable> = []
    
    init(_ mealId: String?) {
        fetchDessert(for: mealId)
    }
    
    private func fetchDessert(for mealId: String?) {
        guard let id = mealId else { return }
        let dessertListEndpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        NetworkManager.shared.fetchData(from: dessertListEndpoint, modelType: DessertDetailResponse.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    // Update UI
                    break
                case .failure(let error):
                    print("Failed to fetch dessert list: \(error)")
                }
    
            }, receiveValue: { [weak self] dessertDetailResponse in
                if let recipe = dessertDetailResponse.meals.first {
                    self?.dessert = recipe
                }
            })
            .store(in: &cancellables)
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
    
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
}
