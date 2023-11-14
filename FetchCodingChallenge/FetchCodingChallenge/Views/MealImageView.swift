//
//  MealImageView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

struct MealImageView: View {
    let imageLinkStr: String?
    let cellWidth: CGFloat
    let cellHeight: CGFloat
    let isCell: Bool
    
    var body: some View {
        if let validLink = imageLinkStr, let imageUrl = URL(string: validLink) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: isCell ? .fit : .fill)
                    .frame(maxWidth: cellWidth, maxHeight: cellHeight)
            } placeholder: {
                ProgressView()
            }
            .frame(width: isCell ? cellWidth : nil, height: isCell ? cellWidth : nil)
            .cornerRadius(10)
            
        }
    }
}

//#Preview {
//    MealImageView()
//}
