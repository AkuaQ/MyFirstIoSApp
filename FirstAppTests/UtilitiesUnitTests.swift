//
//  UtilitiesUnitTests.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/06.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest
@testable import FirstApp
@testable import Dev_Pod

class UtilitiesUnitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenIncorrectPasswordReturnFalse() {
        XCTAssertFalse(Constants.isPasswordValid(""))
    }

    func testGivenCorrectPasswordReturnTrue() {
        XCTAssertTrue(Constants.isPasswordValid("HelloWorld@"))
    }

    func testGivenCreatedUtilitiesReturnNotNil() {
        let utilities = Utilities()
        XCTAssertNotNil(utilities)
    }
}
