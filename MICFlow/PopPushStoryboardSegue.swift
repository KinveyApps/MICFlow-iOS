//
//  PopPushStoryboardSegue.swift
//  MIC Sample App
//
//  Created by Victor Barros on 2015-06-15.
//  Copyright (c) 2015 Kinvey. All rights reserved.
//

import UIKit

class PopPushStoryboardSegue: UIStoryboardSegue {
    
    override func perform() {
        let sourceViewController = self.sourceViewController as! UIViewController
        let destinationViewController = self.destinationViewController as! UIViewController
        let navigationController = sourceViewController.navigationController!
        
        navigationController.popViewControllerAnimated(false)
        navigationController.pushViewController(destinationViewController, animated: true)
    }
   
}
