//
//  UserViewModelUnitTests.swift
//  FirstAppTests
//
//  Created by Akua Afrane-Okese on 2020/03/30.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import XCTest
@testable import Dev_Pod
class UserViewModelUnitTests: XCTestCase {
    var userViewModel: UserViewModel!
    var user: UserModel!
    override func setUp() {
        userViewModel = UserViewModel(view: self)
        user = UserModel(firstName: "TestName", lastName: "TestSurname", email: "TestEmail", password: "Test&Password")
    }

    override func tearDown() {
    }

    func testExample() {
        userViewModel.addUser(with: "TestName", lastName: "TestSurname", email: "TestEmail", and: "Test&Password") {(result) in
        }
        userViewModel.loginUser(with: "TestEmail", and: "Test&Password") {(result) in
        }
    }
}
extension UserViewModelUnitTests: UserViewProtocol {}
