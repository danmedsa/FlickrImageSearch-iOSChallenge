//
//  ContentView.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

struct MainFeedView: View {
    @State private var searchText = ""
    let feed = [FlickrImage.example]
    var imageList: [String] { feed.map { $0.link } }
    
    var searchResult: [FlickrImage] {
        return searchText.isEmpty ? [] : feed
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 16) {
                    ForEach(imageList, id: \.self) { imageLink in
                        GridImageView(image: .example)
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search for Images")

    }
}

#Preview {
    MainFeedView()
}
