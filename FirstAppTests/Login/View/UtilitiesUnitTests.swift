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
