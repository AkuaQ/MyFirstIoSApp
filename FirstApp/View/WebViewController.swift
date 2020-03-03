//
//  WebViewController.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/03/03.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var website = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        let web = website
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
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
