//
//  String+ExtTests.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/20/24.
//

import XCTest
@testable import CVS_CodingChallenge

final class StringExtensionTests: XCTestCase {
    func testParseFlickrDate() throws {
        let date = "2023-08-26T09:45:56-08:00"
        let parsedDate = try XCTUnwrap(date.parseFlickrDate())
        XCTAssertEqual(parsedDate, "Aug 26, 2023 at 9:45 AM")
        
        let invalidDate = "Invalid Date"
        let invalidParseDate = invalidDate.parseFlickrDate()
        XCTAssertNil(invalidParseDate)
    }
}
