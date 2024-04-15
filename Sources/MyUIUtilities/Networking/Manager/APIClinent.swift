//
//  File 2.swift
//  
//
//  Created by Apple on 18/03/2024.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: Endpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}

@available(iOS 15.0, *)
public class URLSessionAPIClient<EndpointType: Endpoint>: APIClient {
   public init () {
        
    }
    public func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> where T : Decodable {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        request.allHTTPHeaderFields = endpoint.header
//        endpoint.header?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        return URLSession.shared.dataTaskPublisher(for: request)
                   .subscribe(on: DispatchQueue.global(qos: .background))
                   .tryMap { data, response -> Data in
                       guard let httpResponse = response as? HTTPURLResponse,
                             (200...299).contains(httpResponse.statusCode) else {
                           throw RequestError.noResponse
                       }
                       return data
                   }
                   .decode(type: T.self, decoder: JSONDecoder())
                   .eraseToAnyPublisher()
            
    }
}


