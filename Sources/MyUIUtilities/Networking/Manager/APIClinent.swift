//
//  File 2.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

protocol APIClient {
    var session: URLSession { get }
    
    func callAPI<T: Decodable> (with request: URLRequest, decode: @escaping (Decodable) -> T?,
                              completion: @escaping (Result<T, APIError>) -> Void)
}

// Extension to default implementation for APIClient protocol
extension APIClient {
    
    // create data task for decoding response
    private func decodingTask<T: Decodable> (with request: URLRequest, decodingType: T.Type, completion: @escaping (Decodable?, APIError?) -> Void) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed) // If there is no response from network
                return
            }
            
            // Check if status code is 200 (success)
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        // Decode JSON response to specified type
                        let result = try JSONDecoder().decode(T.self, from: data)
                        completion(result, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        return task 
    }
    
    // call API with specified request, decode response, and handle completion
    func callAPI<T: Decodable> (with request: URLRequest, decode: @escaping (Decodable) -> T?,
                              completion: @escaping (Result<T, APIError>) -> Void) {
        let task = decodingTask(with: request, decodingType: T.self) { (json, error) in
            
            // Switch to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error)) // Invoke completion with provided error
                    } else {
                        completion(Result.failure(.invalidData)) // Invoke completion with invalidData error
                    }
                    return
                }
                
                // Decode JSON and handle completion
                if let value = decode(json) {
                    completion(Result.success(value))
                } else {
                    completion(Result.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }
}

