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

enum bgColor {
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

enum titleText {
    static let listView = "Desserts"
}
