//
//  UserMock.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/09.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation
@testable import FirstApp
class MockRepo: UserModelProtocol {
    func addUser(with firstName: String, lastName: String,
                 email: String, and password: String,
                 complete: @escaping (String) -> Void) {
        if password != "Test&Password" {
            complete("false")
        }
        complete("true")
    }

    func loginUser(with email: String, and password: String, complete: @escaping ( _ error: String) -> Void) {
        if password != "Test&Password" {
            complete("false")
        }
        complete("true")
    }
}
