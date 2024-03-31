//
//  File.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

// Enum defining a generic result type
public enum Result<T, E> where E: Error {
    case success(T)
    case failure(E)
}
