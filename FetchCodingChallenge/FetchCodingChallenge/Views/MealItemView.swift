//
//  MealItemView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/13/23.
//

import SwiftUI

struct MealItemView: View {
    
    let meal: Dessert
    let cellWidth: CGFloat = ScreenSize.width * 0.45
    
    var body: some View {
        ZStack(alignment: .top) { // Align the VStack to the bottom
            if let validLink = meal.imageLink, let imageUrl = URL(string: validLink) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: cellWidth, maxHeight: .infinity)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: cellWidth, height: cellWidth)
                .cornerRadius(10)
                
            }
            
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
//    MealItemView(meal: MealListViewModel().desserts.first ?? <#default value#>)
//}
