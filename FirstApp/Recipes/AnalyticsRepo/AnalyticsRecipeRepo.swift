//
//  AnalyticsRecipeRepo.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/30.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation
import FirebaseAnalytics
@objc public class AnalyticsRecipeRepo: NSObject {
    @objc public static func favouritePageTabTapped() {
        Analytics.logEvent(AnalyticsRecipeRepoConstants.FavouritesPage.tabFavourites, parameters: nil)
    }

    public static func homePageSearched() {
        Analytics.logEvent(AnalyticsRecipeRepoConstants.HomePage.searchIngredients, parameters: nil)
    }

    public static func homePageTabTapped() {
        Analytics.logEvent(AnalyticsRecipeRepoConstants.HomePage.tabHome, parameters: nil)
    }

    public static func recipeListPageSearched() {
        Analytics.logEvent(AnalyticsRecipeRepoConstants.RecipeListPage.searchRecipes, parameters: nil)
    }

    public static func recipeListPageTabTapped() {
        Analytics.logEvent(AnalyticsRecipeRepoConstants.RecipeListPage.tabRecipeList, parameters: nil)
    }

    public static func recipeDetailPageBrowsed() {
        Analytics.logEvent(AnalyticsRecipeRepoConstants.RecipeDetailPage.recipeDetail, parameters: nil)
    }

    public static func webPageBrowsed() {
        Analytics.logEvent(AnalyticsRecipeRepoConstants.WebPage.webBrowsed, parameters: nil)
    }
    
}
