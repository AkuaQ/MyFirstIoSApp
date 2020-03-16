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
     /*func textExample2() {
       app.tables["Empty list"].searchFields["Search for ingredients"].tap()
        
        
        app2.buttons[
     "Search"].tap()
        app2.tables
         .staticTexts[
            "Fish Mayonnaise Recipe"].tap()
        
        app.buttons["View Instructions"].tap()
        
        
        app.navigationBars["FirstApp.WebView"].buttons["Back"].tap()
    }*/

    func testGivenCorrectSearchReturnSuccessfulAPIResult() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Login"].tap()
        application.textFields["emailLogin"].tap()
        application.tapKeys(text: "tester")
        application.keys["more"].tap()
        application.keys["@"].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "test")
        application.keys["more"].tap()
        application.keys["."].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "com")
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
        application.keys[
        "F"].tap()
        application.tapKeys(text: "ish")
        application.buttons[
            "Search"].tap()
        sleep(2)
        XCTAssert(application.staticTexts["Fish Mayonnaise Recipe"].exists)
    }

}
