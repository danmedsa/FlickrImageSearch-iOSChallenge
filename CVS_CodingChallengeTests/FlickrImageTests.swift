//
//  FlickrImageTests.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/20/24.
//

import XCTest
@testable import CVS_CodingChallenge

final class FlickrImageTests: XCTestCase {
    func testFlickrImageDimensions() {
        let flickrImage = FlickrImage.example
        let dimensions = flickrImage.imageDimensions
        
        XCTAssertEqual(dimensions, "240x160")
    }
}

