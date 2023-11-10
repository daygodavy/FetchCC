//
//  MealListView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import SwiftUI

struct MealListView: View {
    
    @ObservedObject var viewModel: MealListViewModel
    let rowHeight: CGFloat = UIScreen.main.bounds.width * 0.50
    let cellWidth: CGFloat = UIScreen.main.bounds.width * 0.45
    
    var body: some View {
        ZStack {
            Color.brown.brightness(-0.4)
            
            VStack(spacing: 1) {
                headerView
                listView
            }
        }
        .ignoresSafeArea()
    }
    
    var listView: some View {
        return ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0..<viewModel.desserts.count, id: \.self) { index in
                    if index % 2 == 0 {
                        HStack {
                            ForEach(0..<2) { colIndex in
                                let mealIndex = index + colIndex
                                if mealIndex < viewModel.desserts.count {
                                    MealItemView(meal: viewModel.desserts[mealIndex])
                                        .frame(width: cellWidth, height: cellWidth)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                        .frame(height: rowHeight)
                        .padding(.vertical, 10)
                    }
                }
            }
            .padding()
        }
    }
    
    var headerView: some View {
        return VStack {
            Spacer()
            Text("Desserts")
                .font(.system(.title, design: .monospaced, weight: .bold))
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 10)
        }
        .background(Color.brown.brightness(-0.55))
        .frame(maxWidth: .infinity, maxHeight: rowHeight * 0.50)
    }
    
}

struct MealItemView: View {
    
    let meal: Dessert
    let cellWidth: CGFloat = UIScreen.main.bounds.width * 0.45
    
    var body: some View {
        ZStack(alignment: .top) { // Align the VStack to the bottom
            if let validLink = meal.imageLink, let imageUrl = URL(string: validLink) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: cellWidth, maxHeight: .infinity)
                        .background(Color.purple)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: cellWidth, height: cellWidth)
                .cornerRadius(10)
                
            }
            
            VStack(alignment: .center, spacing: 5) {
                Spacer() // Pushes the text to the bottom
                Text(meal.name ?? "N/A")
                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: cellWidth, height: cellWidth * 0.25)
                    .background(Color.black.opacity(0.6))
            }
        }
//        .background(Color.brown)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: cellWidth, height: cellWidth + 20)
    }
}


#Preview {
    MealListView(viewModel: MealListViewModel())
}

