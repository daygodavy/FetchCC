//
//  MealDetailView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/12/23.
//

import SwiftUI

enum ButtonType {
    case ingredients
    case instructions
}

struct MealDetailView: View {
    @ObservedObject var viewModel: MealDetailViewModel
    @State private var selectedButton: ButtonType = .ingredients
    let headerHeight: CGFloat = ScreenSize.height * 0.46
    let detailHeight: CGFloat = ScreenSize.height * 0.58
    
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
    }
    
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
    
    var detailContainerView: some View {
        return ZStack {
            VStack {
                titleView
                VStack(alignment: .leading) {
                    ButtonPickerView(selectedButton: $selectedButton, detailHeight: detailHeight)
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
    
    func getSelectedView() -> AnyView {
        switch selectedButton {
        case .ingredients:
            return AnyView(IngredientsView(items: viewModel.getIngredients(), measures: viewModel.getMeasurements()))
        case .instructions:
            return AnyView(InstructionsView(instructions: viewModel.getInstructions(), height: detailHeight * 0.70))
        }
    }
    
}

#Preview {
    MealDetailView(viewModel: MealDetailViewModel("52929"))
}
