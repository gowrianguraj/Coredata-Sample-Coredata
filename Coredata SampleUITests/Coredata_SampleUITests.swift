//
//  Coredata_SampleUITests.swift
//  Coredata SampleUITests
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import XCTest

class Coredata_SampleUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["Add Dog"].tap()
        app.textFields["Dog Name"].tap()
        
        let ownerTextField = app.textFields["Owner"]
        ownerTextField.tap()
        ownerTextField.tap()
        
        let addABriefDogBioTextField = app.textFields["Add a brief dog bio"]
        addABriefDogBioTextField.tap()
        addABriefDogBioTextField.tap()
        app.buttons["Image"].tap()
        app.sheets["Photo Source"].buttons["Photo Library"].tap()
        XCUIApplication().buttons["Save"].tap()
        
        let app1 = XCUIApplication()
        let element = app1.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.tap()
        app1.buttons["Cancel"].tap()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}

