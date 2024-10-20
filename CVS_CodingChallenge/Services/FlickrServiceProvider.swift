//
//  FlickrServiceProvider.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import Foundation

protocol FlickrServiceProviding {
    func fetchFeed(for search: String) async -> [FlickrImage]
}

struct FlickrServiceProvider: FlickrServiceProviding {
    private var flickrFeedURL: String { "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=" }
    private var serviceHandler: ServiceHandling

    init(session: URLSessionAPI =  URLSession.shared) {
        self.serviceHandler = ServiceHandler(session: session)
    }

    func fetchFeed(for search: String) async -> [FlickrImage] {
        guard let url = URL(string: "\(flickrFeedURL)\(search)"),
              let (response, _) = try? await serviceHandler.makeServiceCall(for: url, type: FlickrSearchResponse.self) else { return [] }

        return response.items
    }
}
