//
//  File.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

// Enum defining different API endpoints
enum API: String {
    case api1 = "api1/string/value" // Endpoint for API 1
    case api2 = "api2/string/value" // Endpoint for API 2
    
    // Function to get the API endpoint with request setup
    func getAPIEndpoint(queryItems: [URLQueryItem] = [], headers: HTTPHeaders = [:], body: Data = Data()) -> Endpoint {
        // Create and return an Endpoint object with the specified properties
        return Endpoint(path: self.rawValue, httpMethod: .post, headers: headers, body: body, queryItems: queryItems)
    }
}

