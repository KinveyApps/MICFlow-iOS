//
//  WebViewController.swift
//  MIC Sample App
//
//  Created by Victor Barros on 2015-06-15.
//  Copyright (c) 2015 Kinvey. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.layer.cornerRadius = 10
        activityIndicatorView.layer.masksToBounds = true
        
        webView = WKWebView()
        webView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.insertSubview(webView, belowSubview: activityIndicatorView)
        
        let views = ["webView" : webView]
        view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|[webView]|",
                options: NSLayoutFormatOptions(0),
                metrics: nil,
                views: views
            )
        )
        view.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|[webView]|",
                options: NSLayoutFormatOptions(0),
                metrics: nil,
                views: views
            )
        )
        
        webView.navigationDelegate = self

        let url = KCSUser.URLforLoginWithMICRedirectURI(redirectURI)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.URL!
        if (KCSUser.isValidMICRedirectURI(redirectURI, forURL: url)) {
            KCSUser.parseMICRedirectURI(redirectURI, forURL: url, withCompletionBlock: { (user: KCSUser!, error: NSError!, actionResult: KCSUserActionResult) -> Void in
                self.performSegueWithIdentifier(Segue.welcome, sender: webView)
            })
            decisionHandler(.Cancel)
        } else {
            decisionHandler(.Allow)
        }
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicatorView.startAnimating()
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        activityIndicatorView.stopAnimating()
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        activityIndicatorView.stopAnimating()
        
        UIAlertView(
            title: "Error",
            message: error.description,
            delegate: nil,
            cancelButtonTitle: nil,
            otherButtonTitles: "OK"
        ).show()
    }

}
