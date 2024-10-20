//
//  ContentView.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

struct MainFeedView: View {
    @State private var searchText = ""
    let elements = (1...10).map { "Image \($0)" }
    
    var searchResult: [String] {
        return searchText.isEmpty ? [] : elements.filter { $0.contains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 16) {
                    ForEach(elements, id: \.self) { feedItem in
                        Text(feedItem)
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
