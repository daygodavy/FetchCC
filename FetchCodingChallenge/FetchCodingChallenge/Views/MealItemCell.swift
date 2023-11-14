//
//  MealItemCell.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

struct MealItemCell: View {
    let meal: Dessert
    let cellWidth: CGFloat = ScreenSize.width * 0.45
    
    var body: some View {
        ZStack(alignment: .top) { // Align the VStack to the bottom
            MealImageView(imageLinkStr: meal.imageLink, 
                          cellWidth: cellWidth,
                          cellHeight: .infinity,
                          isCell: true)
            
            VStack(alignment: .center, spacing: 5) {
                Spacer() // Pushes the text to the bottom
                Text(meal.name ?? "N/A")
                    .padding(.horizontal, 5)
                    .font(ListFont.mealTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: cellWidth, height: cellWidth * 0.25)
                    .background(BgColor.clearBlack90)
            }
            .cornerRadius(10)
            
        }
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: cellWidth, height: cellWidth + (cellWidth * 0.15))
    }
}

//#Preview {
//    MealItemCell()
//}
