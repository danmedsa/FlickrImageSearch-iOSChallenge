//
//  ImageDetailView.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

struct ImageDetailView: View {
    let image: FlickrImage
    var body: some View {
        VStack(spacing: 8) {
            Text("By: \(image.author)")
                .font(.headline)
            AsyncImage(url: URL(string: image.link))  { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            if let date = image.date_taken.parseFlickrDate() {
                Text("Taken on: \(date)")
            }
            Text(image.description)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ImageDetailView(image: .example)
}
