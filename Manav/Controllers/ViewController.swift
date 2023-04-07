//
//  ViewController.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 1.04.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!)
    }
    
   
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpPage", sender: nil)
    }
    
}

