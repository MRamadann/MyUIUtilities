//
//  File 2.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

// Enum defining different API errors
enum APIError: Error {
    case invalidData             // Error for invalid data received
    case requestFailed           // Error for failed API request
    case jsonConversionFailure   // Error for failed JSON conversion
    case jsonParsingFailure      // Error for failed JSON parsing
    case responseUnsuccessful    // Error for unsuccessful API response
    

    var localizedDescription: String {
        switch self {
        case .invalidData:
            return "Invalid Data"
        case .requestFailed:
            return "Request Failed"
        case .jsonConversionFailure:
            return "JSON Conversion Failure"
        case .jsonParsingFailure:
            return "JSON Parsing Failure"
        case .responseUnsuccessful:
            return "Response Unsuccessful"
        }
    }
}

