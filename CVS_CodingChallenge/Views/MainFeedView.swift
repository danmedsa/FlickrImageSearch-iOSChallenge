//
//  ContentView.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

struct MainFeedView: View {
    let viewModel: MainFeedViewModel
    @State private var searchText = ""
    private var feed: [FlickrImage] { viewModel.getImageFeed(for: searchText) }
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 16) {
                    ForEach(feed, id: \.self) { image in
                        GridImageView(image: image)
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search for Images")

    }
}

#Preview {
    MainFeedView(viewModel: .init())
}
