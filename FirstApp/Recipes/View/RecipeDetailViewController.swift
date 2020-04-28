//
//  RecipeDetailViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/19.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit
import Firebase
import WatchConnectivity

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    var navbar = ""
    var sideNavBar = ""
    var image = ""
    var recipeTitle = ""
    var recipeIngredients = ""
    var website = ""
    var username = ""
    let barButtonAppearance = UIBarButtonItem.appearance()
    let database = Firestore.firestore()
    var session: WCSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = recipeTitle
        ingredientsLabel.text = recipeIngredients

        if image == "noImage" {
            recipeImageView.image = UIImage(named: "noImage")
        } else {
            let foodImage = image
            guard let url = URL(string: foodImage) else {fatalError()}
            recipeImageView.downloadImage(from: url)
        }
        self.navigationItem.title = navbar
        self.navigationController?.navigationBar.topItem?.title = sideNavBar
        self.configureWatchKitSesstion()
        //swiftlint:disable all
        database.collection("favourites").whereField("username", isEqualTo: username).whereField("title",
                                                                                                 isEqualTo: recipeTitle)
            .getDocuments() {(snapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if (snapshot?.count ?? 0 > 0) {
                
                self.favouriteButton.setBackgroundImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
                }
            }
        }
        //swiftlint:enable all
    }

    func configureWatchKitSesstion() {
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }

    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        let currentBackgroundImage = favouriteButton.currentBackgroundImage
        if currentBackgroundImage == UIImage(systemName: "star.fill") {
            favouriteButton.setBackgroundImage(UIImage(systemName: "star"), for: UIControl.State.normal)
            //swiftlint:disable all
            database.collection("favourites").whereField("username", isEqualTo: username).whereField("title",
                                                                                                     isEqualTo: recipeTitle)
                .getDocuments() { (snapshot, err)
                    in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    snapshot?.documents.first?.reference.delete()
                }
            }
            //swiftlint:enable all
        } else {
            favouriteButton.setBackgroundImage(UIImage(systemName: "star.fill"), for: UIControl.State.normal)
            database.collection("favourites").addDocument(data: ["username": username,
                                                                 "title": recipeTitle,
                                                                 "thumbnail": image,
                                                                 "ingredients": recipeIngredients,
                                                                 "href": website])
        }
    }

    @IBAction func linkButtonTapped(_ sender: Any) {
        let title = ["title": recipeTitle, "ingredients": recipeIngredients as Any]
        session?.sendMessage(title, replyHandler: nil, errorHandler: {error in
            print(error.localizedDescription)
        })
        let webViewController = storyboard?.instantiateViewController(identifier:
        "WebViewController") as? WebViewController
        webViewController?.website = website
        webViewController?.navbar = "Instructions"
        self.navigationController?.pushViewController(webViewController!, animated: true)
    }
}

extension RecipeDetailViewController: WCSessionDelegate {
    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?) {
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
    }

    func sessionDidDeactivate(_ session: WCSession) {
    }
}
