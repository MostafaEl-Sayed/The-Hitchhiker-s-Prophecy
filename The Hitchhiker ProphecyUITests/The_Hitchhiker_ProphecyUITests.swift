//
//  The_Hitchhiker_ProphecyUITests.swift
//  The Hitchhiker ProphecyUITests
//
//  Created by Mostafa El-Sayed on 23/08/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest

class The_Hitchhiker_ProphecyUITests: XCTestCase {
    
    
    
    func testCollectionViewAppearence() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
       let results = waitDataForLoading()
//        app.buttons["Change Layout"].tap()
        XCTAssertTrue(results)
    }

    // MARK: - Private Helpers
    private func  waitDataForLoading() -> Bool{
        // checking the first element on the data array for existence
        XCUIApplication().collectionViews.staticTexts["Bling!"].waitForExistence(timeout: 5)
        
    }
    
}
