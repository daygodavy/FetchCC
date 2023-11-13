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

    let headerHeight: CGFloat = UIScreen.main.bounds.height * 0.46
    let detailHeight: CGFloat = UIScreen.main.bounds.height * 0.58
    let buttonWidth: CGFloat = UIScreen.main.bounds.width * 0.46
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack {
                if let validLink = viewModel.dessert?.imageLink, let imageUrl = URL(string: validLink) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: headerHeight)
                            .background(Color.purple)
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(10)
                }
                Spacer()
            }
            .background(Color.green)
            

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
//                        .background(Color.brown.brightness(-0.10))
                        .background(selectedButton == .ingredients ? Color.brown.brightness(-0.10) : Color.brown.brightness(-0.05))

                    }
                    .frame(maxWidth: .infinity, maxHeight: detailHeight)
                }
                .background(Color.brown.brightness(-0.45))
                .clipShape(.rect(cornerRadius: 20))
            }
        }
        .ignoresSafeArea()
    }
    
    var titleView: some View {
        return HStack(alignment: .top) {
                    Text("\(viewModel.getMealName())")
                        .font(.system(.title, design: .rounded, weight: .heavy))
                        .foregroundStyle(.orange)
                        .padding(.horizontal, 10)
                        .minimumScaleFactor(0.80)
                }
                .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.10)
                .background(Color.brown.brightness(-0.45))
    }
    
    
    var buttonOptionView: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .center) {
                Button(action: {
                    selectedButton = .ingredients
                }) {
                    Text("Ingredients")
                        .font(.system(.title2, design: .default, weight: selectedButton == .ingredients ? .semibold : .medium))
                        .foregroundColor(selectedButton == .ingredients ? .white : .black)
                }
                .padding()
//                .background(selectedButton == .ingredients ? Color.brown.brightness(-0.40) : Color.brown.brightness(-0.05))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: buttonWidth, maxHeight: detailHeight * 0.08, alignment: .center)
            .background(selectedButton == .ingredients ? Color.brown.brightness(-0.35) : Color.brown.brightness(-0.05))
            .clipShape(.capsule)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 5)
            .padding(.horizontal, 5)
            
            Spacer()
            
            VStack(alignment: .center) {
                Button(action: {
                    selectedButton = .instructions
                }) {
                    Text("Instructions")
                        .font(.system(.title2, design: .default, weight: selectedButton == .instructions ? .semibold : .medium))
                        .foregroundColor(selectedButton == .instructions ? .white : .black)
                }
                .padding()
//                .background(selectedButton == .instructions ? Color.brown.brightness(-0.40) : Color.brown.brightness(-0.05))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: buttonWidth, maxHeight: detailHeight * 0.08, alignment: .center)
            .background(selectedButton == .instructions ? Color.brown.brightness(-0.35) : Color.brown.brightness(-0.05))
            .clipShape(.capsule)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 5)
            .padding(.horizontal, 5)
        }
        .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.12, alignment: .center)
        .background(Color.brown.brightness(-0.10))
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .shadow(color: Color.black.opacity(0.20), radius: 5, x: 0, y: 5)
        .padding(.horizontal, 5)
        .padding(.top, 5)
    }
    
    
    var instructionsView: some View {
        return VStack {
                    ScrollView {
                        Text("\(viewModel.getInstructions())")
                            .font(.system(.title3, design: .default, weight: .medium))
                            .padding(.horizontal, 15)
                            .padding(.bottom, 15)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.70)
                .background(Color.brown.brightness(-0.05))
    }
    
}

struct BulletPointList: View {
    let items: [String]
    let measures: [String]

    var body: some View {
        List(0..<items.count, id: \.self) { index in
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.secondary)
                Text(items[index])
                    .font(.system(.title3, design: .default, weight: .medium))
                
                Spacer()
                
                Text(measures[index])
                    .font(.system(.title3, design: .default, weight: .medium))
            }
            .listRowBackground(Color.brown.brightness(-0.05))
        }
        .scrollContentBackground(.hidden)
        .background(Color.brown.brightness(-0.10))
    }
}

#Preview {
    MealDetailView(viewModel: MealDetailViewModel("52929"))
}
