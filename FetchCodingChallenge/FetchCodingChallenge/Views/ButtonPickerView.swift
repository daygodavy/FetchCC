//
//  ButtonOptionsView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

/// Representation for the button type that was pressed
enum ButtonType {
    case ingredients
    case instructions
}

/*
 ButtonPickerView is a container holds button options that can be toggled
 and is used within the MealDetailView
 */
struct ButtonPickerView: View {
    
    // MARK: - Variables
    @Binding var selectedButton: ButtonType
    let buttonWidth: CGFloat = ScreenSize.width * 0.46
    let detailHeight: CGFloat

    // MARK: - Main Body
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            getButtonOption(for: .ingredients, textLabel: LabelText.ingredients)            
            Spacer()
            getButtonOption(for: .instructions, textLabel: LabelText.instructions)
        }
        .frame(maxWidth: .infinity, maxHeight: detailHeight * 0.12, alignment: .center)
        .background(BgColor.brown10)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .shadow(color: BgColor.clearBlack20, radius: 5, x: 0, y: 5)
        .padding(.horizontal, 5)
        .padding(.top, 5)
    }
}

// MARK: - Helper Methods
extension ButtonPickerView {
    
    /// Sets up the button option corresponding to the specified button type
    func getButtonOption(for buttonType: ButtonType, textLabel: String) -> some View {
        return VStack(alignment: .center) {
            Button(action: {
                selectedButton = buttonType
            }) {
                Text(textLabel)
                    .font(selectedButton == buttonType ? DetailFont.selectedButton : DetailFont.unselectedButton)
                    .foregroundColor(selectedButton == buttonType ? .white : .black)
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: buttonWidth, maxHeight: detailHeight * 0.08, alignment: .center)
        .background(selectedButton == buttonType ? AnyView(BgColor.brown35) : AnyView(BgColor.brown5))
        .clipShape(.capsule)
        .shadow(color: BgColor.clearBlack5, radius: 2, x: 0, y: 5)
        .padding(.horizontal, 5)
    }
}
