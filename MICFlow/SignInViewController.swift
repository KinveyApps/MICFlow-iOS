//
//  ViewController.swift
//  MIC Sample App
//
//  Created by Victor Barros on 2015-06-15.
//  Copyright (c) 2015 Kinvey. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func signInUsingDefaultWebView(sender: AnyObject) {
        KCSUser.presentMICLoginViewControllerWithRedirectURI(
            redirectURI,
            timeout: 60 * 5, //optional parameter: wait for 5 minutes, otherwise close the window automatically
            withCompletionBlock: { (user: KCSUser!, error: NSError!, actionResult: KCSUserActionResult) -> Void in
                if (user != nil) {
                    self.performSegueWithIdentifier(Segue.welcome, sender: sender)
                } else if (actionResult == .KCSUserInteractionCancel) {
                    UIAlertView(
                        title: "KCSUserActionResult",
                        message: "KCSUserInteractionCancel: User hit the cancel button",
                        delegate: nil,
                        cancelButtonTitle: nil,
                        otherButtonTitles: "OK"
                    ).show()
                } else if (actionResult == .KCSUserInteractionTimeout) {
                    UIAlertView(
                        title: "KCSUserActionResult",
                        message: "KCSUserInteractionTimeout: User didn't finish the authentication process before the timeout",
                        delegate: nil,
                        cancelButtonTitle: nil,
                        otherButtonTitles: "OK"
                    ).show()
                } else if (error != nil) {
                    UIAlertView(
                        title: "Error",
                        message: "Something went wrong: \(error)",
                        delegate: nil,
                        cancelButtonTitle: nil,
                        otherButtonTitles: "OK"
                    ).show()
                } else {
                    //should never happen!
                }
            }
        )
    }
    
    @IBAction func signInUsingSafariBrowser(sender: AnyObject) {
        activityIndicatorView.startAnimating()
        
        KCSUser.loginWithAuthorizationCodeLoginPage(redirectURI)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        activityIndicatorView.stopAnimating()
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        activityIndicatorView.stopAnimating()
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: Selector("applicationDidEnterBackgroundNotification:"),
            name: UIApplicationDidEnterBackgroundNotification,
            object: nil
        )
    }
    
    func applicationDidEnterBackgroundNotification(notification: NSNotification) {
        activityIndicatorView.stopAnimating()
    }

}

