//
//  FlickrImageDimensions+Ext.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/20/24.
//

import Foundation

extension FlickrImage {
    var imageDimensions: String? {
        let descriptionElements = description.split(separator: " ")
        guard let widthElement = descriptionElements.first(where: { $0.contains("width=\"")  }),
              let heightElement = descriptionElements.first(where: { $0.contains("height=\"")  }),
              let width = widthElement.split(separator: "=").last?.replacing("\"", with: ""),
              let height = heightElement.split(separator: "=").last?.replacing("\"", with: "")
        else { return nil }
        return "\(width)x\(height)"
    }
}
