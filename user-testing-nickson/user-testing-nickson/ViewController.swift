//
//  ViewController.swift
//  user-testing-nickson
//
//  Created by prk on 06/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var moveToSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    @objc func loginButtonPressed () {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
                makeToast(message: "Please fill in both username and password.")
                return
        }
        makeToast(message: "Logged in successfully!")
    }
    
}

extension UIViewController {
    
    func makeToast(message: String){
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.backgroundColor = .gray
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Lexend", size: 16)
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        toastLabel.frame = CGRect(x: self.view.frame.width / 2 - 175, y: self.view.frame.height - 100, width: 343, height: 46)
        
        self.view.addSubview(toastLabel)
                
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 1.0
            }) { _ in
                UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseIn, animations: {
                    toastLabel.alpha = 0.0
                }) { _ in
            toastLabel.removeFromSuperview()
            }
        }
    }
    
}
