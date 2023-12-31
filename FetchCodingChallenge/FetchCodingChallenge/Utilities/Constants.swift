//
//  Constants.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/13/23.
//

import SwiftUI

/// Dimensions for screen size of device
enum ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

/// Custom background colors
enum BgColor {
    static let brown5: some View = Color.brown.brightness(-0.05)
    static let brown10: some View = Color.brown.brightness(-0.10)
    static let brown35: some View = Color.brown.brightness(-0.35)
    static let brown40: some View = Color.brown.brightness(-0.40)
    static let brown45: some View = Color.brown.brightness(-0.45)
    static let brown50: some View = Color.brown.brightness(-0.50)
    static let clearBlack5 = Color.black.opacity(0.05)
    static let clearBlack20 = Color.black.opacity(0.20)
    static let clearBlack95 = Color.black.opacity(0.95)
}

enum LabelText {
    static let listTitle = "Desserts"
    static let ingredients = "Ingredients"
    static let instructions = "Instructions"
}

enum SystemImage {
    static let circleFill = Image(systemName: "circle.fill")
}

/// Fonts for MealListView
enum ListFont {
    static let listTitle = Font.system(size: UIFont.preferredFont(forTextStyle: .title1).pointSize, weight: .bold)
    static let mealTitle = Font.system(size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize, weight: .semibold)
}


//enum ListFont {
//    static let listTitle = Font.system(.title, design: .monospaced, weight: .bold)
//    static let mealTitle = Font.system(.subheadline, design: .rounded, weight: .semibold)
//}

/// Fonts for MealDetailView
enum DetailFont {
    static let dessertTitle = Font.system(size: UIFont.preferredFont(forTextStyle: .title1).pointSize, weight: .heavy)
    static let selectedButton = Font.system(size: UIFont.preferredFont(forTextStyle: .title2).pointSize, weight: .semibold)
    static let unselectedButton = Font.system(size: UIFont.preferredFont(forTextStyle: .title2).pointSize, weight: .medium)
    static let instructions = Font.system(size: UIFont.preferredFont(forTextStyle: .title3).pointSize, weight: .medium)
    static let bulletList = Font.system(size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize, weight: .medium)
}


//enum DetailFont {
//    static let dessertTitle = Font.system(.title, design: .rounded, weight: .heavy)
//    static let selectedButton = Font.system(.title2, design: .default, weight: .semibold)
//    static let unselectedButton = Font.system(.title2, design: .default, weight: .medium)
//    static let instructions = Font.system(.title3, design: .default, weight: .medium)
//    static let bulletList = Font.system(.subheadline, design: .default, weight: .medium)
//}
