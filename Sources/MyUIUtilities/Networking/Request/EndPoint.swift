//
//  File.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

// Define a typealias for HTTP headers
public typealias HTTPHeaders = [String:String]

// Define an enum for HTTP methods
enum HTTPMethod: String {
    case get        = "GET"
    case post       = "POST"
    case put        = "PUT"
    case delete     = "DELETE"
    case patch      = "PATCH"
    case head       = "HEAD"
    case trace      = "TRACE"
    case connect    = "CONNECT"
    case options    = "OPTIONS"
}

// Define a struct representing an endpoint
public struct Endpoint {
    var path: String                // Endpoint path
    var httpMethod: HTTPMethod      // HTTP method (GET, POST, etc.)
    var headers: HTTPHeaders?       // HTTP headers
    var body: Data?                 // Request body
    var queryItems: [URLQueryItem]? // Query items for the URL
}

// MARK: - Request Setup

extension Endpoint {
    
    // Computed property to generate URL components for the endpoint
    var urlComponents: URLComponents {
        let base: String = "your/base/string"
        var component = URLComponents(string: base)!
        component.path = path
        component.queryItems = queryItems
        return component
    }
    
    // Computed property to generate URLRequest for the endpoint
    var request: URLRequest {
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod  = httpMethod.rawValue // Set HTTP method
        request.httpBody    = body // Set request body
        if  let headers = headers {
            for(headerField, headerValue) in headers {
                request.setValue(headerValue, forHTTPHeaderField: headerField) // Set HTTP headers
            }
        }
        request.httpShouldHandleCookies = true
        return request
    }
}
