//
//  ContentView.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

struct MainFeedView: View {
    @State var viewModel: MainFeedViewModel
    @State var searchText = ""
    @State var isLoading = false
    var body: some View {
        NavigationStack {
            if !isLoading {
                ScrollView {
                    LazyVGrid(columns: [GridItem()], spacing: 16) {
                        ForEach(viewModel.feed, id: \.self) { image in
                            NavigationLink(destination: ImageDetailView(image: image)) {
                                GridImageView(image: image)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            } else {
                ProgressView()
            }
        }
        .searchable(text: $searchText, prompt: "Search for Images")
        .onChange(of: searchText) { _, search in
            Task.init {
                isLoading = true
                await viewModel.updateImageFeed(for: search)
                isLoading = false
            }
        }
    }
}

#Preview {
    MainFeedView(viewModel: .init())
}
