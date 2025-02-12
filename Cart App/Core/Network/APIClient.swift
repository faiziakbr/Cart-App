//
//  APIClient.swift
//  Cart App
//
//  Created by Faizan Akbar on 12/02/2025.
//

import Foundation
import Combine

final class APIClient {
    static let shared = APIClient()
    private init() {}

    func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, Error> {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
