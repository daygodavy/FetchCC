//
//  InstructionsView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

/*
 InstructionsView is a scroll view that displays all
 the text for the instructions of a dessert item's recipe
 within the MealDetailView
 */
struct InstructionsView: View {
    
    // MARK: - Variables
    let instructions: String
    let height: CGFloat
    
    // MARK: - Main Body
    var body: some View {
        VStack {
            ScrollView {
                Text(instructions)
                    .font(DetailFont.instructions)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: height)
        .background(BgColor.brown5)
    }
}
