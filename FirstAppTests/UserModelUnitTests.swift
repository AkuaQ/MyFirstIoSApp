//
//  UserModelUnitTests.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/06.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest
@testable import FirstApp

class UserModelUnitTests: XCTestCase {

    var user: User!
    override func setUp() {
        user = User(firstName: "TestName", lastName: "TestSurname", email: "TestEmail", password: "Test&Password")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenSignUpValuesReturnSuccess() {
        let closure = user.addUser(with: user.firstName, lastName: user.lastName, email: user.email, and: user.password) {(result) in
        }
        XCTAssertNotNil(closure)
    }
    func testGivenLoginValuesReturnSuccess() {
        let closure = user.loginUser(with: user.email, and: user.password) {(result) in
        }
        XCTAssertNotNil(closure)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
