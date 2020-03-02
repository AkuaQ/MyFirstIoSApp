//
//  UserViewModel.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/27.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation

struct UserViewModel {
    func addUser(with firstName: String, lastName: String, email: String, and password: String) -> String {
        let user = User(firstName: firstName, lastName: lastName, email: email, password: password)
        let errorMessage = user.addUser(with: firstName, lastName: lastName, email: email, and: password)
        return errorMessage
    }

    func loginUser(with email: String, and password: String) -> String {
        let user = User(firstName: "", lastName: "", email: email, password: password)
        let errorMessage = user.loginUser(with: email, and: password)
        return errorMessage
    }
}
