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
    let buttonWidth: CGFloat = ScreenSize.width * 0.46
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                MealImageView(imageLinkStr: viewModel.dessert?.imageLink,
                              cellWidth: .infinity,
                              cellHeight: headerHeight,
                              isCell: false)
                
                Spacer()
            }
            
            VStack {
                Spacer()

                ZStack {
                    
                    VStack {
                        titleView
                        
                        VStack(alignment: .leading) {

                            buttonOptionView
                            
                            if selectedButton == .ingredients {
                                BulletPointList(items: viewModel.getIngredients(), measures: viewModel.getMeasurements())
                            } else {
                                instructionsView
                                    .frame(maxWidth: .infinity, maxHeight: detailHeight)
                            }
                            
                        }
                        .background(selectedButton == .ingredients ? AnyView(BgColor.brown10) : AnyView(BgColor.brown5))

                    }
                    .frame(maxWidth: .infinity, maxHeight: detailHeight)
                }
                .background(BgColor.brown45)
                .clipShape(.rect(cornerRadius: 20))
            }
        }
        .ignoresSafeArea()
    }
    
    var titleView: some View {
        return HStack(alignment: .top) {
                    Text("\(viewModel.getMealName())")
                        .font(DetailFont.mealTitle)
                        .foregroundStyle(.orange)
                        .padding(.horizontal, 10)
                        .minimumScaleFactor(0.80)
                }
                .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.10)
                .background(BgColor.brown45)
    }
    
    
    var buttonOptionView: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .center) {
                Button(action: {
                    selectedButton = .ingredients
                }) {
                    Text(LabelText.ingredients)
                        .font(selectedButton == .ingredients ? DetailFont.selectedButton : DetailFont.unselectedButton)
                        .foregroundColor(selectedButton == .ingredients ? .white : .black)
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: buttonWidth, maxHeight: detailHeight * 0.08, alignment: .center)
            .background(selectedButton == .ingredients ? AnyView(BgColor.brown35) : AnyView(BgColor.brown5))
            .clipShape(.capsule)
            .shadow(color: BgColor.clearBlack5, radius: 2, x: 0, y: 5)
            .padding(.horizontal, 5)
            
            Spacer()
            
            VStack(alignment: .center) {
                Button(action: {
                    selectedButton = .instructions
                }) {
                    Text(LabelText.instructions)
                        .font(selectedButton == .instructions ? DetailFont.selectedButton : DetailFont.unselectedButton)
                        .foregroundColor(selectedButton == .instructions ? .white : .black)
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: buttonWidth, maxHeight: detailHeight * 0.08, alignment: .center)
            .background(selectedButton == .instructions ? AnyView(BgColor.brown35) : AnyView(BgColor.brown5))
            .clipShape(.capsule)
            .shadow(color: BgColor.clearBlack5, radius: 2, x: 0, y: 5)
            .padding(.horizontal, 5)
        }
        .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.12, alignment: .center)
        .background(BgColor.brown10)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .shadow(color: BgColor.clearBlack20, radius: 5, x: 0, y: 5)
        .padding(.horizontal, 5)
        .padding(.top, 5)
    }
    
    
    var instructionsView: some View {
        return VStack {
                    ScrollView {
                        Text("\(viewModel.getInstructions())")
                            .font(DetailFont.instructions)
                            .padding(.horizontal, 15)
                            .padding(.bottom, 15)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.70)
                .background(BgColor.brown5)
    }
    
}

struct BulletPointList: View {
    let items: [String]
    let measures: [String]

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

#Preview {
    MealDetailView(viewModel: MealDetailViewModel("52929"))
}
