//
//  AnalyticsUnitTests.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/30.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest
@testable import Dev_Pod
class AnalyticsUnitTests: XCTestCase {
    override func setUp() {
        
    }

    override func tearDown() {
    }

    func testGivenAnalyticsReturnNotNil() {
        AnalyticsLoginRepo.landingPageLoginTapped()
        AnalyticsLoginRepo.landingPageSignUpTapped()
        AnalyticsLoginRepo.loginPageLoginTapped()
        AnalyticsLoginRepo.signUpPageCreateAccountTapped()
        AnalyticsRecipeRepo.favouritePageTabTapped()
        AnalyticsRecipeRepo.homePageSearched()
        AnalyticsRecipeRepo.homePageTabTapped()
        AnalyticsRecipeRepo.recipeDetailPageBrowsed()
        AnalyticsRecipeRepo.recipeListPageSearched()
        AnalyticsRecipeRepo.recipeListPageTabTapped()
        AnalyticsRecipeRepo.webPageBrowsed()
    }
}
