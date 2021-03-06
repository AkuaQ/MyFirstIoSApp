//
//  LoginUITest.swift
//  FirstAppUITests
//
//  Created by Akua Afrane-Okese on 2020/03/14.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest

class LoginUITests: XCTestCase {
    var application: XCUIApplication!

    override func setUp() {
        application = XCUIApplication()
        setupSnapshot(application)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenIncorrectUsernameCredsReturnFailure() {
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
        application.tapKeys(text: "test")
        application.keys["more"].tap()
        application.keys["1"].tap()
        application.keys["?"].tap()
        application.keys["more"].tap()
        application.buttons["Log in"].tap()
        sleep(4)
    XCTAssertFalse(application.staticTexts["What are your ingredients?"].exists)
    }

    func testGivenEmptyUsernameFieldsReturnFailure() {
        application.launch()
        application.buttons["Login"].tap()
        application.buttons["Log in"].tap()
        XCTAssert(application.staticTexts["Please fill in all fields"].exists)
    }

    func testGivenEmptyPasswordFieldsReturnFailure() {
        application.launch()
       application.buttons["Login"].tap()
        application.textFields["emailLogin"].tap()
        application.tapKeys(text: "tester")
        application.buttons["Log in"].tap()
        XCTAssert(application.staticTexts["Please fill in all fields"].exists)
    }

    func testGivenNoExistingUserCredsReturnFailure() {
        application.launch()
        application.buttons["Login"].tap()
        application.textFields["emailLogin"].tap()
        application.tapKeys(text: "wrongtester")
        application.keys["more"].tap()
        application.keys["5"].tap()
        application.keys["more"].tap()
        application.keys["more"].tap()
        application.keys["@"].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "test")
        application.keys["more"].tap()
        application.keys["."].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "com")
        application.secureTextFields["passwordLogin"].tap()
        application.tapKeys(text: "wrongtestpassword")
        application.keys["more"].tap()
        application.keys["1"].tap()
        application.keys["?"].tap()
        application.keys["more"].tap()
        application.buttons["Log in"].tap()
        sleep(4)
    XCTAssertFalse(application.staticTexts["What are your ingredients?"].exists)
    }

    func testGivenCorrectCredsReturnSuccess() {
        application.launch()
        snapshot("WelcomeScreen")
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
        snapshot("LoginScreen")
        application.buttons["Log in"].tap()
        sleep(8)
    XCTAssert(application.staticTexts["What are your ingredients?"].exists)
    }
}
