//
//  FoodRequest.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/18.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation

struct FoodRequest {
    var countryCode: String

    let defaultSession = URLSession(configuration: .default)

    var dataTask: URLSessionDataTask?

    func getSearchResult(completionHandler: @escaping([FoodDetails]) -> Void) {
       dataTask?.cancel()

        let resourceString = "http://www.recipepuppy.com/api/?q=\(countryCode)"

        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, response, error in

            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                print(data)

                do {
                    let foodList = try JSONDecoder().decode(SwiftForFoodResults.self, from: data)

                    completionHandler(foodList.resultCount)
                } catch let error {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
}
