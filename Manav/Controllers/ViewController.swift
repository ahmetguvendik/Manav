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
    
    var alertController = UIAlertController()
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { resukt, error in
            if error == nil {
                self.performSegue(withIdentifier: "toMainPage", sender: nil)
            } else {
                self.errorAlert(error: "HATA")
            }
        }
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpPage", sender: nil)
    }
    
        
    func errorAlert(error : String){
           alertController = UIAlertController(title: "Hata", message: error, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .cancel)
           alertController.addAction(okButton)
           present(alertController, animated: true)
       }
    
}

