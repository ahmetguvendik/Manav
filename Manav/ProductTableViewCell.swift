//
//  ProductTableViewCell.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 13.04.2023.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    
    @IBAction func addToBasket(_ sender: Any) {
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
