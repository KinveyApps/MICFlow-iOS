//
//  WelcomeViewController.swift
//  MIC Sample App
//
//  Created by Victor Barros on 2015-06-15.
//  Copyright (c) 2015 Kinvey. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = KCSUser.activeUser()
        let givenName = user.givenName ?? ""
        let surname = user.surname ?? ""
        let email = user.email ?? ""
        welcomeLabel.text = "Welcome\n\n" +
            "Name: \(givenName) \(surname)\n" +
            "Username: \(user.username)\n" +
            "User Id: \(user.userId)\n" +
            "Email: \(email)\n"
    }

}
