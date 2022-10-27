//
//  DisplayViewController.swift
//  BrowserApp
//
//  Created by Anderson Sales on 26/10/22.
//

import UIKit
import WebKit

class DisplayViewController: UIViewController  {
    
    var webView: WKWebView!
    var company: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let startUrl = "https://www."
        let endUrl = ".com"
        let url = URL(string: "\(startUrl)\(company!)\(endUrl)")!
        print(url)
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension DisplayViewController: WKNavigationDelegate{
    
}
