//
//  MainFeedViewModelTests.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/20/24.
//

import XCTest
@testable import CVS_CodingChallenge

final class MainFeedViewModelTests: XCTestCase {
    enum TestCase {
        case happyPath
        case emptySearch
    }
    
    func testUpdateImageFeed() {
        var mockSession = MockURLSession(testCase: .happyPath)
        var sut = MainFeedViewModel(session: mockSession)
        Task {
            await sut.updateImageFeed(for: "")
            XCTAssertEqual(sut.feed, [])
        }
        
        mockSession = MockURLSession(testCase: .happyPath)
        sut = MainFeedViewModel(session: mockSession)
        Task {
            await sut.updateImageFeed(for: "Test")
            XCTAssertFalse(sut.feed != [])
        }
    }
    
    func testNoSearchResult() {
        var mockSession = MockURLSession(testCase: .emptySearch)
        var sut = MainFeedViewModel(session: mockSession)
        Task {
            await sut.updateImageFeed(for: "")
            XCTAssertTrue(sut.noResultSearch)
        }
        
        mockSession = MockURLSession(testCase: .happyPath)
        sut = MainFeedViewModel(session: mockSession)
        Task {
            await sut.updateImageFeed(for: "Test")
            XCTAssertFalse(sut.noResultSearch)
        }
    }
}

private struct MockURLSession: URLSessionAPI {
    var testCase: MainFeedViewModelTests.TestCase
    func data(from url: URL) async throws -> (Data, URLResponse) {
        let result = testCase == .emptySearch ? [] : [FlickrImage.example]
        let imageList = try! JSONEncoder().encode(result)
        return(imageList, URLResponse())
    }
}
