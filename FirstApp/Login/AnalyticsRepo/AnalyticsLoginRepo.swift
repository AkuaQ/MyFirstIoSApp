//
//  AnalyticsRepo.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/30.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation
import FirebaseAnalytics

struct AnalyticsLoginRepo {
    static func landingPageSignUpTapped() {
        Analytics.logEvent(AnalyticsLoginRepoConstants.LandingPage.signUpButton, parameters: nil)
    }

    static func landingPageLoginTapped() {
        Analytics.logEvent(AnalyticsLoginRepoConstants.LandingPage.loginButton, parameters: nil)
    }

    static func loginPageLoginTapped() {
        Analytics.logEvent(AnalyticsLoginRepoConstants.LoginPage.loginButton, parameters: nil)
    }

    static func signUpPageCreateAccountTapped() {
        Analytics.logEvent(AnalyticsLoginRepoConstants.SignUpPage.signUpButton, parameters: nil)
    }
}
