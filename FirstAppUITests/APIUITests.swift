//
//  APIUITests.swift
//  FirstAppUITests
//
//  Created by Akua Afrane-Okese on 2020/03/15.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest

class APIUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenCorrectSearchReturnSuccessfulDetailAndWebsite() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Login"].tap()
        application.textFields["emailLogin"].tap()
        application.textFields["emailLogin"].typeText("tester@test.com")
        application.secureTextFields["passwordLogin"].tap()
        application.tapKeys(text: "testpassword")
        application.keys["more"].tap()
        application.keys["1"].tap()
        application.keys["?"].tap()
        application.keys["more"].tap()
        application.buttons["Log in"].tap()
        sleep(8)
        application.searchFields[
            "Search for ingredients"].tap()
        application.searchFields["Search for ingredients"].typeText("Fish")
        /*application.keys[
        "F"].tap()
        application.tapKeys(text: "ish")*/
        application.buttons[
            "Search"].tap()
        sleep(2)
        application.staticTexts["Delicious Fish Curry Recipe"].tap()
        sleep(2)
        application.buttons["View Instructions"].tap()
        sleep(8)
    }
}
