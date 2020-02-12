//
//  ViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/02/06.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func firstButtonTapped(_ sender: UIButton) {
        sender.flash()
        print("Facebook sign in chosen")
    }
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        sender.flash()
        print("Google sign in chosen")    }
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        sender.flash()
        print("Email sign in chosen")    }
}
