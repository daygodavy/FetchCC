//
//  BulletPointListView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

struct IngredientsView: View {
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

//#Preview {
//    BulletPointListView()
//}
