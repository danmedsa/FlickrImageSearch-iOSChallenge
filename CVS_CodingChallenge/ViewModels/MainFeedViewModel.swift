//
//  MainFeedViewModel.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import Foundation
import SwiftUICore

class MainFeedViewModel {
    
    private var serviceProvider: FlickrServiceProviding
    private(set) var feed = [FlickrImage]()
    
    var noResultSearch: Bool { feed.isEmpty }
    
    init(session: URLSessionAPI = URLSession.shared) {
        self.serviceProvider = FlickrServiceProvider(session: session)
    }
    
    func updateImageFeed(for search: String) async {
        guard !search.isEmpty else {
            feed = []
            return
        }
        
        do {
            feed = await serviceProvider.fetchFeed(for: search)
        }
    }
}
