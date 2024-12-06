//
//  SignUpViewController.swift
//  user-testing-nickson
//
//  Created by prk on 06/12/24.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var alreadyHaveAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        alreadyHaveAccountButton.addTarget(self, action: #selector(backtoLoginPage), for: .touchUpInside)
    }
    
    @objc func signUpButtonPressed () {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let email = emailTextField.text, !email.isEmpty else {
                makeToast(message: "Please fill in username, email, and password")
                return
        }
        makeToast(message: "Registered successfully!")
        
    }
    
    @objc func backtoLoginPage() {
        dismiss(animated: true)
    }
    
}
