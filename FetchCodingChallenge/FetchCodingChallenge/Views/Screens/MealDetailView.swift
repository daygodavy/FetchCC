//
//  MealDetailView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/12/23.
//

import SwiftUI

/*
 MealDetailView shows the recipe for the dessert item that was
 selected from the MealListView
 */
struct MealDetailView: View {
    
    // MARK: - Variables
    @ObservedObject var viewModel: MealDetailViewModel
    @State private var selectedButton: ButtonType = .ingredients
    let headerHeight: CGFloat = ScreenSize.height * 0.46
    let detailHeight: CGFloat = ScreenSize.height * 0.58
    
    // MARK: - Main Body
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                MealImageView(imageLinkStr: viewModel.getMealImageStr(),
                              cellWidth: .infinity,
                              cellHeight: headerHeight,
                              isCell: false)
                Spacer()
            }
            VStack {
                Spacer()
                detailContainerView
            }
        }
        .ignoresSafeArea()
        .errorAlert(error: $viewModel.error)
    }
}

// MARK: - Subviews
extension MealDetailView {
    
    var titleView: some View {
        return HStack(alignment: .top) {
                    Text("\(viewModel.getMealName())")
                        .font(DetailFont.dessertTitle)
                        .foregroundStyle(.orange)
                        .padding(.horizontal, 10)
                        .minimumScaleFactor(0.80)
                }
                .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.10)
                .background(BgColor.brown45)
    }
    
    /// Container that holds the title, buttons and recipe details
    var detailContainerView: some View {
        return ZStack {
            VStack {
                titleView
                VStack(alignment: .leading) {
                    ButtonPickerView(selectedButton: $selectedButton, 
                                     detailHeight: detailHeight)
                    getSelectedView()
                        .frame(maxWidth: .infinity, maxHeight: detailHeight)
                }
                .background(selectedButton == .ingredients ? AnyView(BgColor.brown10) : AnyView(BgColor.brown5))
            }
            .frame(maxWidth: .infinity, maxHeight: detailHeight)
        }
        .background(BgColor.brown45)
        .clipShape(.rect(cornerRadius: 20))
    }
}

// MARK: - Helper Methods
extension MealDetailView {
    
    /// Retrieves the appropriate view that corresponds to the selected button
    func getSelectedView() -> AnyView {
        switch selectedButton {
        case .ingredients:
            return AnyView(IngredientsView(items: viewModel.getIngredients(), 
                                           measures: viewModel.getMeasurements()))
        case .instructions:
            return AnyView(InstructionsView(instructions: viewModel.getInstructions(), 
                                            height: detailHeight * 0.70))
        }
    }
}

#Preview {
    MealDetailView(viewModel: MealDetailViewModel("52929"))
}
