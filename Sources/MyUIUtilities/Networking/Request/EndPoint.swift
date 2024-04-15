//
//  File.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var scheme: String? { get }
    var host: String? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: Data? { get }
}


