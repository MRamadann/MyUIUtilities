//
//  File 2.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

// Protocol defining an API client
protocol APIClient {
    var session: URLSession { get } // URLSession for network tasks
    
    // Function to call API with specified request, decode response, and handle completion
    func callAPI<T: Decodable> (with request: URLRequest, decode: @escaping (Decodable) -> T?,
                              completion: @escaping (Result<T, APIError>) -> Void)
}

// Extension to provide default implementation for APIClient protocol
extension APIClient {
    // Typealias for completion handler in data task
    typealias jsonTaskCompletionHandler = (Decodable?, APIError?) -> Void
    
    // Function to create data task for decoding response
    private func decodingTask<T: Decodable> (with request: URLRequest, decodingType: T.Type, completion: @escaping jsonTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // Check if response is HTTPURLResponse
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed) // Invoke completion with requestFailed error
                return
            }
            
            // Check if status code is 200 (success)
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        // Decode JSON response to specified type
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil) // Invoke completion with decoded model
                    } catch {
                        completion(nil, .jsonConversionFailure) // Invoke completion with jsonConversionFailure error
                    }
                } else {
                    completion(nil, .invalidData) // Invoke completion with invalidData error
                }
            } else {
                completion(nil, .responseUnsuccessful) // Invoke completion with responseUnsuccessful error
            }
        }
        return task // Return URLSessionDataTask
    }
    
    // Function to call API with specified request, decode response, and handle completion
    func callAPI<T: Decodable> (with request: URLRequest, decode: @escaping (Decodable) -> T?,
                              completion: @escaping (Result<T, APIError>) -> Void) {
        let task = decodingTask(with: request, decodingType: T.self) { (json, error) in
            
            // Switch to main queue
            DispatchQueue.main.async {
                // Check if JSON response exists
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
                    completion(Result.success(value)) // Invoke completion with decoded value
                } else {
                    completion(Result.failure(.jsonParsingFailure)) // Invoke completion with jsonParsingFailure error
                }
            }
        }
        task.resume() // Resume URLSessionDataTask
    }
}

