//
//  WebViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/03.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit
import WebKit
import Dev_Pod

class WebViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var website = ""
    var navbar = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        let web = website
        self.navigationItem.title = navbar
        self.navigationController?.navigationBar.topItem?.title = "Recipe Details"
        let url = URL(string: web)!
        webView = WKWebView(frame: self.view.frame)
        webView.isUserInteractionEnabled = true
        webView.navigationDelegate = self
        self.view.addSubview(self.webView)
        webView.load(URLRequest(url: url))

        // add activity
        self.webView.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.webView.navigationDelegate = self
        self.activityIndicator.hidesWhenStopped = true
        AnalyticsRecipeRepo.webPageBrowsed()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
