//
//  ErrorHandler.swift
//  FetchCodingChallenge
//
//  Created by Davy Chuon on 11/14/23.
//

import Foundation

/// Custom enum for network errors
enum NetworkError: String, Error {
    case invalidURL = "The page you are trying to access created an invalid request. Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data receieved from the server was invalid. Please try again."
}


/*
 ErrorHandler determines corresponding error type to represent the proper error
 */
struct ErrorHandler: Error {
    
    func errorMessage(from error: Error?) -> String {
        guard let networkError = error as? NetworkError else {
            return "An unexpected error occurred. Please try again."
        }
        return networkError.rawValue
    }
}
