//
//  SignInViewController.swift
//  MIC Sample App
//
//  Created by Victor Barros on 2015-06-15.
//  Copyright (c) 2015 Kinvey. All rights reserved.
//

import UIKit

class NativeSignInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func signIn(sender: AnyObject) {
        activityIndicatorView.startAnimating()
        
        KCSUser.loginWithAuthorizationCodeAPI(
            redirectURI,
            options: [
                KCSUsername : usernameTextField.text,
                KCSPassword : passwordTextField.text
            ],
            withCompletionBlock: { (user: KCSUser!, error: NSError!, actionResult: KCSUserActionResult) -> Void in
                if (user != nil) {
                    self.performSegueWithIdentifier(Segue.welcome, sender: sender)
                } else {
                    UIAlertView(
                        title: "Error",
                        message: error.description,
                        delegate: nil,
                        cancelButtonTitle: nil,
                        otherButtonTitles: "OK"
                    ).show()
                }
                
                self.activityIndicatorView.stopAnimating()
            }
        )
    }

}
