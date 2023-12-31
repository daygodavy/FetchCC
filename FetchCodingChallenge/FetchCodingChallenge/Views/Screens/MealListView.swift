//
//  MealListView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/10/23.
//

import SwiftUI

/*
 MealListView is the initial view that shows all the dessert
 items; image and name, in a scrollable collection view
 */
struct MealListView: View {
    
    // MARK: - Variables
    @ObservedObject var viewModel: MealListViewModel
    private let rowHeight: CGFloat = ScreenSize.width * 0.50
    private let cellWidth: CGFloat = ScreenSize.width * 0.45
    
    // MARK: - Main Body
    var body: some View {
        ZStack {
            BgColor.brown40
            VStack(spacing: 1) {
                headerView
                ScrollView { collectionView }
            }
        }
        .ignoresSafeArea()
        .errorAlert(error: $viewModel.error)
    }
}

// MARK: - Subviews
extension MealListView {
    
    private var headerView: some View {
        return VStack {
            Spacer()
            Text(LabelText.listTitle)
                .font(ListFont.listTitle)
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 10)
        }
        .background(BgColor.brown50)
        .frame(maxWidth: .infinity, maxHeight: rowHeight * 0.50)
    }
    
    /// Collections view that displays MealItemCells in 2 columns by X rows
    private var collectionView: some View {
        return VStack(alignment: .leading, spacing: 10) {
            ForEach(0..<viewModel.getMealCount(), id: \.self) { index in
                if index % 2 == 0 {
                    createRow(at: index)
                        .frame(height: rowHeight)
                        .padding(.vertical, 10)
                }
            }
        }
        .padding()
    }
}

// MARK: - Helper Methods
extension MealListView {
    
    /// Creates a 2 column row of MealItemCells
    private func createRow(at index: Int) -> some View {
        return HStack {
            ForEach(0..<2) { colIndex in
                if let currentMeal = viewModel.getMeal(at: index + colIndex) {
                    NavigationLink(destination: MealDetailView(viewModel: MealDetailViewModel(currentMeal.id))) {
                        MealItemCell(meal: currentMeal)
                            .frame(width: cellWidth, height: cellWidth)
                            .padding(.horizontal, 5)
                    }
                }
            }
        }
    }
}

#Preview {
    MealListView(viewModel: MealListViewModel())
}
