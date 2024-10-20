//
//  GridImageView.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

struct GridImageView: View {
    let image: FlickrImage
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.link))
            Text("More Details")
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    GridImageView(image: .example)
}
