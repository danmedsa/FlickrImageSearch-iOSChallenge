//
//  MainFeedViewModel.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

class MainFeedViewModel {
    let feed = [FlickrImage.example]
    
    func getImageFeed(for search: String) -> [FlickrImage] {
        search.isEmpty ? [] : feed
    }
}
