//
//  BasketTableViewCell.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 13.04.2023.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
