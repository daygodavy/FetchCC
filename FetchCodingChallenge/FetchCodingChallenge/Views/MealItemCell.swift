//
//  MealItemCell.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

/*
 MealItemCell are the cells used within the MealListView collection view
 which show the image and name of the dessert
 */
struct MealItemCell: View {
    
    // MARK: - Variables
    let meal: Dessert
    let cellWidth: CGFloat = ScreenSize.width * 0.45
    
    // MARK: - Main Body
    var body: some View {
        ZStack(alignment: .top) {
            MealImageView(imageLinkStr: meal.imageLink,
                          cellWidth: cellWidth,
                          cellHeight: .infinity,
                          isCell: true)
            mealTitleBanner
        }
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: cellWidth, height: cellWidth + (cellWidth * 0.15))
    }
}

// MARK: - Subviews
extension MealItemCell {
    
    /// Displays the name of the dessert in a banner
    var mealTitleBanner: some View {
        return VStack(alignment: .center, spacing: 5) {
            Spacer()
            Text(meal.name ?? "N/A")
                .padding(.horizontal, 5)
                .font(ListFont.mealTitle)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .frame(width: cellWidth, height: cellWidth * 0.25)
                .background(BgColor.clearBlack95)
        }
        .cornerRadius(10)
    }
}
