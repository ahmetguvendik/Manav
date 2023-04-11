//
//  MainViewController.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 11.04.2023.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("HATA")
        }
    }
    

}
