//
//  AboutModel.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/04/07.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation

public struct AboutResults: Decodable {
    var about: [AboutModel]
}

public struct AboutModel: Decodable {
    var aboutId: Int?
    var title: String
    var description: String
}
