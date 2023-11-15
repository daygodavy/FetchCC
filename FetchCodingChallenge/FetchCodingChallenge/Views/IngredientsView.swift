//
//  BulletPointListView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

/*
 IngredientsView is a list view used in the MealDetailView
 that shows all the ingredients and corresponding measurements
 for a dessert item in a bullet point list fashion
 */
struct IngredientsView: View {
    
    // MARK: - Variables
    let items: [String]
    let measures: [String]

    // MARK: - Main Body
    var body: some View {
        List(0..<items.count, id: \.self) { index in
            HStack {
                SystemImage.circleFill
                    .foregroundColor(.secondary)
                Text(items[index])
                    .font(DetailFont.bulletList)
                Spacer()
                Text(measures[index])
                    .font(DetailFont.bulletList)
            }
            .listRowBackground(BgColor.brown5)
        }
        .scrollContentBackground(.hidden)
        .background(BgColor.brown10)
    }
}
