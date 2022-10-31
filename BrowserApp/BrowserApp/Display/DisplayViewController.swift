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
    var progressView: UIProgressView!
    static var websites = ["apple", "google"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configRightBarButtonItem()
        configToolBarItems()
        configURL()
    }
    
    func configToolBarItems(){
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let back = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        toolbarItems = [back, progressButton, spacer, refresh, forward]
        navigationController?.isToolbarHidden = false
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    func configURL(){
        let startUrl = "https://www."
        let endUrl = ".com"
        let url = URL(string: "\(startUrl)\(company!)\(endUrl)")!
        
        for _ in DisplayViewController.websites {
            if DisplayViewController.websites.contains(company!){
                print("\(company ?? "The informed value") is already in the list!")
            } else {
                DisplayViewController.websites.append(company!)
            }
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func configRightBarButtonItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        //ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        //ac.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage))
        //Refactoring the code to iterate the array of websites
        for website in DisplayViewController.websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction){
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://www.\(actionTitle).com") else { return }
        webView.load(URLRequest(url: url))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
}

extension DisplayViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in DisplayViewController.websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        decisionHandler(.cancel)
    }
}
