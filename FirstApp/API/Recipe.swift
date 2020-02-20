//
//  Recipe.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/18.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation

struct SwiftForFoodResults: Decodable {
    var resultCount: [FoodDetails]

    enum CodingKeys: String, CodingKey {
        case resultCount = "results"
    }
}

struct FoodResponse: Decodable {
    var foods: SwiftForFoodResults
}

struct FoodDetails: Decodable {
    var title: String
    var ingredients: String
    var href: String
    var thumbnail: String
}
