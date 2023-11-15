//
//  MealImageView.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

/*
 MealImageView downloads the image from URL and displays it
 */
struct MealImageView: View {
    
    // MARK: - Variables
    let imageLinkStr: String?
    let cellWidth: CGFloat
    let cellHeight: CGFloat
    let isCell: Bool
    
    // MARK: - Main Body
    var body: some View {
        /// Asynchronously downloads image from URL and sets image
        if let validLink = imageLinkStr, let imageUrl = URL(string: validLink) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: isCell ? .fit : .fill)
                    .frame(maxWidth: cellWidth, maxHeight: cellHeight)
            } placeholder: {
                /// Displays progress view until image captured
                ProgressView()
            }
            .frame(width: isCell ? cellWidth : nil, height: isCell ? cellWidth : nil)
            .cornerRadius(10)
        }
    }
}
