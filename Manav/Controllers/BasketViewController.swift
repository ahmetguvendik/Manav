//
//  BasketViewController.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 13.04.2023.
//

import UIKit
import Firebase

class BasketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTVC") as! BasketTableViewCell
        cell.productName.text = basketArray[indexPath.row].productName
        cell.productPrice.text = "\(basketArray[indexPath.row].productPrice)"
        return cell
    }
    
    
    @IBOutlet var totalPriceLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "toMainPage", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getBasket()
        getTotalPrice()
        
        // Do any additional setup after loading the view.
    }
    var totalCost = 0
    @IBOutlet var tableView: UITableView!
    var basketArray = [Basket]()
    func getBasket(){
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser?.email
        db.collection("Baskets").document(currentUser!).collection("BasketProdcut").addSnapshotListener { query, error in
            if error == nil {
                if query?.isEmpty == false {
                    self.basketArray.removeAll(keepingCapacity: true)
                    for datas in query!.documents{
                        if let productName = datas.get("ProductName") as? String {
                            if let price = datas.get("ProductPrice") as? String {
                                let baskets = Basket(productName: productName, productPrice: Int(price)!)
                                self.basketArray.append(baskets)
                            }
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    func getTotalPrice(){
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser?.email
        db.collection("Baskets").document(currentUser!).collection("BasketProdcut").addSnapshotListener { query, error in
           if error == nil {
               if query?.isEmpty == false {
                   for data in query!.documents {
                       if let price = data.get("ProductPrice") as? String{
                           self.totalCost += Int(price)!
                           self.totalPriceLabel.text = String(self.totalCost)
                       }
                            
                   }
               }
            }
        }
    }
    
}
   
    
    

 


