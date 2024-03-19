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
    
    // Computed property to provide a localized description for each error
    var localizedDescription: String {
        switch self {
        case .invalidData:
            return "Invalid Data" // Description for invalid data error
        case .requestFailed:
            return "Request Failed" // Description for request failed error
        case .jsonConversionFailure:
            return "JSON Conversion Failure" // Description for JSON conversion failure error
        case .jsonParsingFailure:
            return "JSON Parsing Failure" // Description for JSON parsing failure error
        case .responseUnsuccessful:
            return "Response Unsuccessful" // Description for unsuccessful API response error
        }
    }
}

