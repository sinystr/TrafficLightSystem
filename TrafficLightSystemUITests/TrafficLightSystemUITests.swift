//
//  TrafficLightSystemUITests.swift
//  TrafficLightSystemUITests
//
//  Created by Georgi Georgiev on 29.10.24.
//

import XCTest

final class TrafficLightSystemUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    @MainActor
    func testValidCarModelFlow() throws {
        let app = XCUIApplication()
        app.launch()

        let carModelTextField = app.textFields["Enter Car model"]
        XCTAssertTrue(carModelTextField.exists)
        carModelTextField.tap()
        
        carModelTextField.typeText("Ford Mustang")
        
        let driveButton = app.buttons["Drive"]
        XCTAssertTrue(driveButton.exists)
        driveButton.tap()
        
        let carModelText = app.staticTexts["Ford Mustang"]
        XCTAssertTrue(carModelText.waitForExistence(timeout: 5))
    }
    
    @MainActor
    func testInvalidCarModelNameFlow() throws {
        let app = XCUIApplication()
        app.launch()

        let carModelTextField = app.textFields["Enter Car model"]
        XCTAssertTrue(carModelTextField.exists)
        carModelTextField.tap()
        
        carModelTextField.typeText("**")
        
        let driveButton = app.buttons["Drive"]
        XCTAssertTrue(driveButton.exists)
        XCTAssertFalse(driveButton.isEnabled)
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
