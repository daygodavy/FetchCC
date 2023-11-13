//
//  Constants.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/13/23.
//

import SwiftUI


enum ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

enum UISize {
    static let cornerRad = 10
    static let padding: CGFloat = 15
}

enum BgColor {
    static let brown5: some View = Color.brown.brightness(-0.05)
    static let brown10: some View = Color.brown.brightness(-0.10)
    static let brown35: some View = Color.brown.brightness(-0.35)
    static let brown40: some View = Color.brown.brightness(-0.40)
    static let brown45: some View = Color.brown.brightness(-0.45)
    static let brown50: some View = Color.brown.brightness(-0.50)
    static let clearBlack5 = Color.black.opacity(0.05)
    static let clearBlack20 = Color.black.opacity(0.20)
    static let clearBlack90 = Color.black.opacity(0.9)
}

enum LabelText {
    static let listTitle = "Desserts"
    static let ingredients = "Ingredients"
    static let instructions = "Instructions"
}

enum SystemImage {
    static let circleFill = Image(systemName: "circle.fill")
}

enum ListFont {
    static let listTitle = Font.system(.title, design: .monospaced, weight: .bold)
    static let mealTitle = Font.system(.subheadline, design: .rounded, weight: .semibold)
}

enum DetailFont {
    static let mealTitle = Font.system(.title, design: .rounded, weight: .heavy)
    static let selectedButton = Font.system(.title2, design: .default, weight: .semibold)
    static let unselectedButton = Font.system(.title2, design: .default, weight: .medium)
    static let instructions = Font.system(.title3, design: .default, weight: .medium)
    static let bulletList = Font.system(.subheadline, design: .default, weight: .medium)
}
