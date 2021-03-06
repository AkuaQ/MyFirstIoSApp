//
//  UserModelUnitTests.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/06.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest
import Dev_Pod
@testable import FirstApp

class UserModelUnitTests: XCTestCase {

    var user: UserModel!
    var repo: UserModelProtocol!
    override func setUp() {
        repo = UserModel(firstName: "TestName", lastName: "TestSurname", email: "TestEmail", password: "Test&Password")
        user = UserModel(firstName: "Kim", lastName: "Possible", email: "kim@p.com", password: "CallMeMeetMe")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenCorrectUserModelValuesReturnSuccess() {
        XCTAssertNotNil(user)
        XCTAssertEqual(user.firstName, "Kim")
        XCTAssertEqual(user.lastName, "Possible")
        XCTAssertEqual(user.email, "kim@p.com")
        XCTAssertEqual(user.password, "CallMeMeetMe")
    }

    func testGivenIncorrectUserModelValuesReturnfailure() {
        XCTAssertNotNil(user)
        XCTAssertNotEqual(user.firstName, "Kimmy")
        XCTAssertNotEqual(user.lastName, "Impossible")
        XCTAssertNotEqual(user.email, "kimmy@p.com")
        XCTAssertNotEqual(user.password, "If")
    }

    func testGivenSignUpValuesReturnSuccess() {
        let closure = repo.addUser(with: "TestName",
                                   lastName: "TestSurname", email: "TestEmail", and: "Test&Password") {result in
                                    print(result)
        }
        XCTAssertNotNil(closure)
    }
    func testGivenLoginValuesReturnSuccess() {
        let closure = repo.loginUser(with: "TestEmail", and: "Test&Password") {result in
             print(result)
        }
        XCTAssertNotNil(closure)
    }
}
