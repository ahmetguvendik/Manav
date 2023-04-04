//
//  ViewController.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 1.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
    }
    
    private var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height * 0.1, width: UIScreen.main.bounds.width, height: 50))
      label.textAlignment = .center
      label.text = "Manav"

      return label
        
    }()
    
    private var usernameTextField: UISearchTextField = {
        
        let usernameTextField = UISearchTextField(frame: CGRect(x: 0, y: UIScreen.main.bounds.height * 0.2, width: UIScreen.main.bounds.width, height: 50))
        usernameTextField.textAlignment = .center
        usernameTextField.placeholder = "E Mail Giriniz"
        return usernameTextField
        
    }()

    private var passwordTextField: UISearchTextField = {
        
        let passwordTextField = UISearchTextField(frame: CGRect(x: 0, y: UIScreen.main.bounds.height * 0.3, width: UIScreen.main.bounds.width, height: 50))
        passwordTextField.textAlignment = .center
        passwordTextField.placeholder = "Password Giriniz"
        return passwordTextField
        
    }()
    
    private var signInButton : UIButton = {
        let signInButton = UIButton(frame: CGRect(x: 0, y: UIScreen.main.bounds.height * 0.4, width: UIScreen.main.bounds.width, height: 50))
        return signInButton
    }()
    
}

