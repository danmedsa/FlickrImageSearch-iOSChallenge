//
//  ImageDetailViewUITests.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/20/24.
//

import XCTest

final class ImageDetailViewUITests: XCTestCase {
    let app: XCUIApplication = XCUIApplication()
    
    static override func setUp() {
        let application = XCUIApplication()
        application.launch()
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testImageDetailView() {
        navigateToDetailScreen()
    }
}

private extension ImageDetailViewUITests {
    func navigateToDetailScreen() {
        let searchbar = app.searchFields.element.firstMatch
        searchbar.tap()
        searchbar.typeText("Porcupine")
        let item = app.staticTexts["More Details"].firstMatch
        item.tap()
        
        let descriptionPredicate = NSPredicate(format: "label contains %@", "Displaying the image Fall Color by:nobody@flickr.com (\"Didi Fu\"), Taken on: Oct 11, 2015 at 2:02 AM with description: Didi Fu posted a photo:")
        let descriptionText = app.staticTexts.containing(descriptionPredicate).firstMatch
        let backButton = app.buttons["Back"]
                XCTAssertTrue(descriptionText.exists)
        XCTAssertTrue(backButton.exists)
        
        backButton.tap()
        
        XCTAssertFalse(backButton.exists)
    }
}
