//
//  AdminLoginViewController.swift
//  Hospitalist Hours Log
//
//  Created by Peter Lyn on 12/22/17.
//  Copyright © 2017 Peter Lyn. All rights reserved.
//


import UIKit
import Firebase




class AdminLoginViewController : UIViewController {
    
    @IBOutlet weak var adminUserEmail: UITextField!
    
    @IBOutlet weak var adminUserPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var adminLoginButtonPressed: UIButton!
    
}

