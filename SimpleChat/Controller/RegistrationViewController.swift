//
//  RegistrationViewController.swift
//  SimpleChat
//
//  Created by Egor Lass on 08.10.2020.
//  Copyright © 2020 Egor Mezhin. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    let errorAlertController = UIAlertController(title: "Error",
                                                                 message: error.localizedDescription,
                                                                 preferredStyle: .alert)
                    errorAlertController.addAction(UIAlertAction(title: "Ok",
                                                                 style: .default,
                                                                 handler: nil))
                    self.present(errorAlertController, animated: true,
                                 completion: nil)
                } else {
                    self.performSegue(withIdentifier: Constants.registerSegueIdentifier,
                                      sender: self)
                }
            }
        }
    }
}
