//
//  ImageDetailView.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

struct ImageDetailView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    let image: FlickrImage
    
    private var description: AttributedString {
        image.description.htmlAttributedString(font: .body)
    }
    
    private var date: String? {
        image.date_taken.parseFlickrDate()
    }
    
    var body: some View {
        if verticalSizeClass != .compact || dynamicTypeSize > .xLarge {
            ScrollView {
                VStack(spacing: 8) {
                    Text("By: \(image.author)")
                        .font(.headline)
                    ZStack(alignment: .bottomLeading) {
                        AsyncImage(url: URL(string: image.link))  { image in
                            image.resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                                .task {
                                    print("Loading: \(image.link)")
                                }
                        }
                        Text(image.imageDimensions ?? "")
                            .background(.white)
                    }
                    if let date {
                        Text("Taken on: \(date)")
                    }
                    Text(description)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding()
                .accessibilityLabel("Displaying the image \(image.title) by:\(image.author), Taken on: \(date ?? "Date Unavailable") with description: \(description)")
            }
        } else {
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: image.link))  { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                        .task {
                            print("Loading: \(image.link)")
                        }
                }
                ScrollView {
                    VStack(spacing: 8) {
                        Text("By: \(image.author)")
                            .font(.headline)
                        if let date = image.date_taken.parseFlickrDate() {
                            Text("Taken on: \(date)")
                        }
                        Text(description)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding()
                    .accessibilityLabel("Displaying the image \(image.title) by:\(image.author), Taken on: \(date ?? "Date Unavailable") with description: \(description)")
                }
            }
        }
    }
}

#Preview {
    ImageDetailView(image: .example)
}
