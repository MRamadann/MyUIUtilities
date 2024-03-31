//
//  File 2.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

public enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case encode
    
    var customMessage: String {
        switch self {
        case .encode:
            return "encode error"
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}

