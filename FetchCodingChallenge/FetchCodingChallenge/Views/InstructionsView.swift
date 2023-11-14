//
//  InstructionsView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

struct InstructionsView: View {
    let instructions: String
    let height: CGFloat
    
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

//#Preview {
//    InstructionsView()
//}
