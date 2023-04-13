//
//  ProductTableViewCell.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 13.04.2023.
//

import UIKit
import Firebase

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    
    @IBAction func addToBasket(_ sender: Any) {
        let currentUser = Auth.auth().currentUser?.email
        let db = Firestore.firestore()
        if currentUser != nil {
            let uuid = UUID()
            let data = ["ProductName": productNameLabel.text , "ProductPrice" : priceLabel.text] as! [String : Any]
            db.collection("Baskets").document(currentUser!).collection("BasketProdcut").document(uuid.uuidString).setData(data)
               
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

}
