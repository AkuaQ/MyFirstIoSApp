//
//  APIUITests.swift
//  FirstAppUITests
//
//  Created by Akua Afrane-Okese on 2020/03/15.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest

class APIUITests: XCTestCase {
    var application: XCUIApplication!
    override func setUp() {
        application = XCUIApplication()
        setupSnapshot(application)
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenCorrectIngredientsSearchReturnSuccessfulDetailAndWebsite() {
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
        snapshot("HomeScreen")
        application.searchFields["Search for ingredients"].typeText("Fish")
        application.buttons[
            "Search"].tap()
        application.staticTexts["Fish"].tap()
        snapshot("HomeResultsScreen")
       application.staticTexts["Delicious Fish Curry Recipe"].tap()
        sleep(2)
        snapshot("DetailScreen")
        application.buttons["View Instructions"].tap()
        sleep(8)
    }

    func testGivenCorrectRecipesSearchReturnSuccessfulDetailAndWebsite() {
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
        application.tabBars.buttons["Recipe List"].tap()
        application.searchFields[
            "Search for recipes"].tap()
        application.searchFields["Search for recipes"].typeText("Chocolate cake")
        application.buttons[
        "Search"].tap()
        sleep(8)
       application.staticTexts["Tim and Tracy's Chocolate Cake (Boiled)"].tap()
        sleep(2)
        application.buttons["View Instructions"].tap()
        sleep(8)
    }
}
