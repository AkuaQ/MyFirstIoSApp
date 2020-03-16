//
//  FirstAppUITests.swift
//  FirstAppUITests
//
//  Created by Akua Afrane-Okese on 2020/03/14.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest

class SignUpUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenIncorrectPasswordReturnFailure() {
        // UI tests must launch the application that they test.
        let application = XCUIApplication()
        application.launch()
        application.buttons["Sign up"].tap()
        application.textFields["firstName"].tap()
        application.tapKeys(text: "test")
        application.textFields["lastName"].tap()
        application.tapKeys(text: "test")
        application.keys["space"].tap()
        application.tapKeys(text: "last")
        application.keys["space"].tap()
        application.tapKeys(text: "name")
        application.textFields["emailSignUp"].tap()
        application.tapKeys(text: "testtestcom")
        application.secureTextFields["passwordSignUp"].tap()
        application.tapKeys(text: "testssword")
        application.buttons["Create Account"].tap()
        XCTAssert(application.staticTexts[
            "Please make sure your password is at least characters, contains a special character and a number."].exists)
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGivenReturningUserReturnFailure() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Sign up"].tap()
        application.textFields["firstName"].tap()
        application.tapKeys(text: "tester")
        application.textFields["lastName"].tap()
        application.tapKeys(text: "tester")
        application.keys["space"].tap()
        application.tapKeys(text: "last")
        application.keys["space"].tap()
        application.tapKeys(text: "name")
        application.textFields["emailSignUp"].tap()
        application.tapKeys(text: "test")
        application.keys["more"].tap()
        application.keys["@"].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "test")
        application.keys["more"].tap()
        application.keys["."].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "com")
        application.secureTextFields["passwordSignUp"].tap()
        application.tapKeys(text: "testpassword")
        application.keys["more"].tap()
        application.keys["1"].tap()
        application.keys["?"].tap()
        application.keys["more"].tap()
        application.buttons["Create Account"].tap()
        sleep(4)
        XCTAssert(application.staticTexts["Error creating user"].exists)
    }

    func testGivenEmptyFieldsReturnFailure() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Sign up"].tap()
        application.buttons["Create Account"].tap()
        XCTAssert(application.staticTexts["Please fill in all fields"].exists)
    }

    func testGivenEmptyLastNameFieldsReturnFailure() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Sign up"].tap()
        application.textFields["firstName"].tap()
        application.tapKeys(text: "tester")
        application.buttons["Create Account"].tap()
        XCTAssert(application.staticTexts["Please fill in all fields"].exists)
    }

    func testGivenEmptyEmailFieldsReturnFailure() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Sign up"].tap()
        application.textFields["firstName"].tap()
        application.tapKeys(text: "tester")
        application.textFields["lastName"].tap()
        application.tapKeys(text: "tester")
        application.buttons["Create Account"].tap()
        XCTAssert(application.staticTexts["Please fill in all fields"].exists)
    }

    func testGivenEmptyPasswordFieldsReturnFailure() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Sign up"].tap()
        application.textFields["firstName"].tap()
        application.tapKeys(text: "tester")
        application.textFields["lastName"].tap()
        application.tapKeys(text: "tester")
        application.textFields["emailSignUp"].tap()
        application.tapKeys(text: "tester")
        application.buttons["Create Account"].tap()
        XCTAssert(application.staticTexts["Please fill in all fields"].exists)
    }

    func testGivenCorrectCredsReturnSuccess() {
        let application = XCUIApplication()
        application.launch()
        application.buttons["Sign up"].tap()
        application.textFields["firstName"].tap()
        application.tapKeys(text: "tester")
        application.keys["more"].tap()
        application.keys["0"].tap()
        application.keys["more"].tap()
        application.textFields["lastName"].tap()
        application.tapKeys(text: "tester")
        application.keys["more"].tap()
        application.keys["0"].tap()
        application.keys["more"].tap()
        application.keys["space"].tap()
        application.tapKeys(text: "last")
        application.keys["space"].tap()
        application.tapKeys(text: "name")
        application.textFields["emailSignUp"].tap()
        application.tapKeys(text: "tester")
        application.keys["more"].tap()
        application.keys["0"].tap()
        application.keys["more"].tap()
        application.keys["more"].tap()
        application.keys["@"].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "test")
        application.keys["more"].tap()
        application.keys["."].tap()
        application.keys["more"].tap()
        application.tapKeys(text: "com")
        application.secureTextFields["passwordSignUp"].tap()
        application.tapKeys(text: "testpassword")
        application.keys["more"].tap()
        application.keys["1"].tap()
        application.keys["?"].tap()
        application.keys["more"].tap()
        application.buttons["Create Account"].tap()
        sleep(8)
        XCTAssert(application.staticTexts["What are your Ingredients?"].exists)
    }
}
