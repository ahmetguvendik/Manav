//
//  Order.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 19.04.2023.
//

import Foundation

class Order {
    var adressTitle : String
    var adressText : String
    var adreesCity : String
    var adressDistrict : String
    var totalPrice : Int
    
    init(adressTitle: String, adressText: String, adreesCity: String, adressDistrict: String, totalPrice: Int) {
        self.adressTitle = adressTitle
        self.adressText = adressText
        self.adreesCity = adreesCity
        self.adressDistrict = adressDistrict
        self.totalPrice = totalPrice
    }
    
}
