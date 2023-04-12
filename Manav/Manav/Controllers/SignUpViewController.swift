//
//  SignUpViewController.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 7.04.2023.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController,UINavigationControllerDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    @IBOutlet var bactToSignIn: UIButton!
    
    @IBAction func backToSignInAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil) //back to page
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var alertController = UIAlertController()
    @IBAction func signUpButton(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" && passwordTextField.text == confirmPasswordTextField.text{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, error in
                if error == nil {
                    self.succesAlert(message: "Kayit Olma Basarili")
                   
                    let db = Firestore.firestore()
                    let personInfo = ["email" : self.emailTextField.text ?? "" , "Ad" : self.nameTextField.text ?? "" , "Soyad" : self.surnameTextField.text ?? "" , "Yas" : self.ageTextField.text ?? ""] as [String : Any]
                    db.collection("Users").document(self.emailTextField.text!).setData(personInfo) { error in
                        if error != nil {
                            self.errorAlert(error: error?.localizedDescription ?? "HATA")
                        }
                        
                    }
                        
                }
                else{
                    self.errorAlert(error: error?.localizedDescription ?? "")
                }
            }
        }
        else{
            self.errorAlert(error: "Kullanıcı Adı ve ya Sifre Yok/Eşleşmiyor")
        }
      
      
        
    }
   
    func errorAlert(error : String){
           alertController = UIAlertController(title: "Hata", message: error, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .cancel)
           alertController.addAction(okButton)
           present(alertController, animated: true)
       }
    
    func succesAlert(message : String){
           alertController = UIAlertController(title: "Succes", message: message, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .cancel)
           alertController.addAction(okButton)
           present(alertController, animated: true)
       }
    
}

   

