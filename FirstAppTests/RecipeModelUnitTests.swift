//
//  RecipeModelUnitTests.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/09.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest
@testable import Dev_Pod
class RecipeModelUnitTests: XCTestCase {

    var recipe: FoodDetails!
    override func setUp() {
        recipe = FoodDetails()
    }

    override func tearDown() {
    }

    func testGivenRecipeReturnNotNil() {
        XCTAssertNotNil(recipe)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
