//
//  ServiceHandler.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import Foundation

protocol ServiceHandling {
    func makeServiceCall<T: Decodable>(for url: URL, type: T.Type) async throws -> (T, URLResponse)
}

struct ServiceHandler: ServiceHandling {
    
    enum ServiceError: Error {
        case invalidURL
    }
    
    private var session: URLSessionAPI
    
    init(session: URLSessionAPI) {
        self.session = session
    }
    
    func makeServiceCall<T: Decodable>(for url: URL, type: T.Type) async throws -> (T, URLResponse) {
        print(url.absoluteString)
        let (data, response) = try await session.data(from: url)
        let responseObject = try JSONDecoder().decode(type.self, from: data)
        return (responseObject, response)
    }
}
