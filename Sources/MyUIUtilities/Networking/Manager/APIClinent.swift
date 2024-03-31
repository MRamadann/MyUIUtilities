//
//  File 2.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation

public protocol HTTPClient {
   func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

@available(iOS 15.0, *)
extension HTTPClient {
   public func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    )
     async -> Result<T, RequestError> {
        var urlComponents = URLComponents()
//        urlComponents.scheme = endpoint.scheme
//        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
         request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

//        if let body = endpoint.body {
//            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//        }
         if let body = endpoint.body {
             do {
                 request.httpBody = try JSONEncoder().encode(body)
             } catch {
                 print("Error encoding request body: \(error)")
                 return .failure(.encode)
             }
         }
         do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
