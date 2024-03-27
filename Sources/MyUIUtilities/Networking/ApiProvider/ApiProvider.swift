//
//  File.swift
//  
//
//  Created by Apple on 27/03/2024.
//

import Foundation

class APIProvider {
    
   static let shared = APIProvider()
   private init() {}
    
    func executeRequest(request: URLRequest) async throws -> (Data, URLResponse){
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            return (data, response)
        }
        catch{
            throw error
        }
    }
    
}
