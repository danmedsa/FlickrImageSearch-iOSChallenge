//
//  URLSession+Ext.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import Foundation

protocol URLSessionAPI {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionAPI {}
