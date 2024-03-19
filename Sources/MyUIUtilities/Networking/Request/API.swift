//
//  File.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

enum API: String {
    case api = ""
    
    // get the API endpoint with request setup
    func getAPIEndpoint(queryItems: [URLQueryItem] = [], headers: HTTPHeaders = [:], body: Data = Data()) -> Endpoint {
        // Create and return an Endpoint object with the specified properties
        return Endpoint(path: self.rawValue, httpMethod: .post, headers: headers, body: body, queryItems: queryItems)
    }
}

