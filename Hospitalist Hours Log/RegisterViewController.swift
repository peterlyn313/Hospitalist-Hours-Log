//
//  RegisterViewController.swift
//  Hospitalist Hours Log
//
//  Created by Peter Lyn on 12/22/17.
//  Copyright © 2017 Peter Lyn. All rights reserved.
//



import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var passwordValidationLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet var textFields: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup View
        setupView()
        
        // Register View Controller as Observer
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: Notification.Name.UITextFieldTextDidChange, object: nil)
        
    }
    
    // MARK: - View Methods
    
   fileprivate func setupView() {
        // Configure Register Button
        registerButton.isEnabled = false
        
        // Configure Password Validation Label
        passwordValidationLabel.isHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Notification Handling
    
    @objc private func textDidChange(_ notification: Notification) {
        var formIsValid = true
        
        for textField in textFields {
            // Validate Text Field
            let (valid, _) = validate(textField)
            
            guard valid else {
                formIsValid = false
                break
            }
        }
        
        // Update Save Button
        registerButton.isEnabled = formIsValid
    }
    
    
    // MARK: - Helper Methods
    
    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return (false, nil)
        }
        
        if textField == userPassword {
            return (text.characters.count >= 6, "Your password is too short.")
        }
        
        return (text.characters.count > 0, "This field cannot be empty.")
    }


    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                print("registration sucessfull")
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToLog" , sender: self)
            }
           
        }
    }
 
 
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            userPassword.becomeFirstResponder()
        case userPassword:
            // Validate Text Field
            let (valid, message) = validate(textField)
            
            if valid {
                userEmail.becomeFirstResponder()
            }
            
            // Update Password Validation Label
            self.passwordValidationLabel.text = message
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.passwordValidationLabel.isHidden = valid
            })
        default:
            userEmail.resignFirstResponder()
        }
        
        return true
}
}


