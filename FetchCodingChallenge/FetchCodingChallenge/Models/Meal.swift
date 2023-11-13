//
//  Meal.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/9/23.
//

import Foundation

struct DessertList: Codable {
    let meals: [Dessert]
}

struct Dessert: Codable {
    let name: String?
    let imageLink: String?
    let id: String?
    
//    let imageUrl: URL = {
//        
//    }
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case imageLink = "strMealThumb"
        case id = "idMeal"
    }
}

struct DessertDetailResponse: Codable {
    let meals: [DessertDetail]
}

struct DessertDetail: Codable {
    let id: String?
    let name: String?
    let category: String?
    let placeOfOrigin: String?
    let instructions: String?
    let imageLink: String?
//    let tags: String?
    let youtubeLink: String?
    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?
    let ingredient16: String?
    let ingredient17: String?
    let ingredient18: String?
    let ingredient19: String?
    let ingredient20: String?
    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?
    let measure16: String?
    let measure17: String?
    let measure18: String?
    let measure19: String?
    let measure20: String?
    let sourceLink: String?
    
    var ingredients: [String] {
        var ingredients: [String?] = []
        
        ingredients.append(ingredient1)
        ingredients.append(ingredient2)
        ingredients.append(ingredient3)
        ingredients.append(ingredient4)
        ingredients.append(ingredient5)
        ingredients.append(ingredient6)
        ingredients.append(ingredient7)
        ingredients.append(ingredient8)
        ingredients.append(ingredient9)
        ingredients.append(ingredient10)
        ingredients.append(ingredient11)
        ingredients.append(ingredient12)
        ingredients.append(ingredient13)
        ingredients.append(ingredient14)
        ingredients.append(ingredient15)
        ingredients.append(ingredient16)
        ingredients.append(ingredient17)
        ingredients.append(ingredient18)
        ingredients.append(ingredient19)
        ingredients.append(ingredient20)
        
        return ingredients.compactMap { $0 }.filter { !$0.isEmpty }
    }
    
    var measurements: [String] {
        var measurements: [String?] = []
        
        measurements.append(measure1)
        measurements.append(measure2)
        measurements.append(measure3)
        measurements.append(measure4)
        measurements.append(measure5)
        measurements.append(measure6)
        measurements.append(measure7)
        measurements.append(measure8)
        measurements.append(measure9)
        measurements.append(measure10)
        measurements.append(measure11)
        measurements.append(measure12)
        measurements.append(measure13)
        measurements.append(measure14)
        measurements.append(measure15)
        measurements.append(measure16)
        measurements.append(measure17)
        measurements.append(measure18)
        measurements.append(measure19)
        measurements.append(measure20)
        
        return measurements.compactMap { $0 }.filter { !$0.isEmpty }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case placeOfOrigin = "strArea"
        case instructions = "strInstructions"
        case imageLink = "strMealThumb"
        case youtubeLink = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
        case sourceLink = "strSource"
    }
}
