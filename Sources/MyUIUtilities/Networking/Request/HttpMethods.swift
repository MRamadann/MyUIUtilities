//
//  File.swift
//  
//
//  Created by Apple on 30/03/2024.
//

import Foundation

public enum HTTPMethod: String {
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
