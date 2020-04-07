//
//  AboutRequest.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/04/07.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation

public struct AboutRequest {
    public let defaultSession = URLSession(configuration: .default)

    public var dataTask: URLSessionDataTask?

    public func getAboutResult(completionHandler: @escaping([AboutModel]) -> Void) {
       dataTask?.cancel()

        let serverString = "http://localhost:8080/about"
        guard let resourceURL = URL(string: serverString) else {fatalError()}
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                print(data)
                DispatchQueue.main.async {
                    do {
                        let aboutList = try JSONDecoder().decode(AboutResults.self, from: data)
                        completionHandler(aboutList.about)
                    } catch let error {
                        print(error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
