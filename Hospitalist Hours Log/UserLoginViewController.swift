//
//  UserLoginViewController.swift
//  Hospitalist Hours Log
//
//  Created by Peter Lyn on 12/22/17.
//  Copyright © 2017 Peter Lyn. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class UserLoginViewController : UIViewController {
    
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            }
            else {
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier:"goToLog", sender: self)
            }
        }
        
    }
}
