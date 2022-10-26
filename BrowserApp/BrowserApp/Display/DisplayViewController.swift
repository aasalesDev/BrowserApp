//
//  DisplayViewController.swift
//  BrowserApp
//
//  Created by Anderson Sales on 26/10/22.
//

import UIKit
import WebKit

class DisplayViewController: UIViewController, WKNavigationDelegate  {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
