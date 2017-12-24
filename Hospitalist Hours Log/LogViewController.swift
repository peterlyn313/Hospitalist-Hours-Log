//
//  LogViewController.swift
//  Hospitalist Hours Log
//
//  Created by Peter Lyn on 12/22/17.
//  Copyright © 2017 Peter Lyn. All rights reserved.
//

import UIKit
import Firebase




class LogViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print("error, there was a problem signing out.")
        }
    }
}

