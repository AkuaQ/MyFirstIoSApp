//
//  Constants.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/11.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation

struct Constants {
    struct Storyboard {
        static let homeViewController = "HomeVC"
    }
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
