//
//  TabBarNavigationItem.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 12.04.2023.
//

import UIKit
import Firebase

class TabBarNavigationItem: UINavigationItem {

    
    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("HATA")
        }
    }
    
}
