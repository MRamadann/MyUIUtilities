//
//  File.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

// Enum defining a generic result type
enum Result<T, E> where E: Error {
    // Case for successful result with associated value of type T
    case success(T)
    // Case for failed result with associated value of type E (error)
    case failure(E)
}
