//
//  View+Ext.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import SwiftUI

extension View {
    
    /// Presents error alert modally in view
    func errorAlert(error: Binding<Error?>, buttonTitle: String = "OK") -> some View {
        return self.alert(isPresented: Binding<Bool>(
            get: { error.wrappedValue != nil },
            set: { _ in error.wrappedValue = nil }
        )) {
            Alert(
                title: Text("Something went wrong!"),
                message: Text(ErrorHandler().errorMessage(from: error.wrappedValue)),
                dismissButton: .default(Text(buttonTitle))
            )
        }
    }
}
