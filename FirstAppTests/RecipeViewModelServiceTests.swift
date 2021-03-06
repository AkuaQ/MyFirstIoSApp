//
//  RecipeViewModelServiceTests.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/09.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest
@testable import Dev_Pod
class RecipeViewModelServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGivenSearchCredsReturnSearchResultTitle() {
        var searchResultTitle = ""
        let foodRequest = FoodRequest(foodQuery: "fish", typeQuery: "i")
        foodRequest.getSearchResult {(result) in
                        searchResultTitle = result[0].title
            XCTAssertEqual(searchResultTitle, "Delicious Fish Curry Recipe")
        }
    }

    func testGivenSearchCredsReturnSearchResultTitleFailure() {
        var searchResultTitle = ""
        let foodRequest = FoodRequest(foodQuery: "fishy", typeQuery: "i")
        foodRequest.getSearchResult {(result) in
                        searchResultTitle = result[0].title
            XCTAssertNotEqual(searchResultTitle, "Fish Marinade for People Who Hate Fish")
        }
    }
}
