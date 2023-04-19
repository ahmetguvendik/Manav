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
    
    
    @IBAction func payButton(_ sender: Any) {
        performSegue(withIdentifier: "toPayPage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPayPage" {
            let payVC = segue.destination as! PayViewController
            payVC.totalPrice = String(self.totalCost)
         
        }
    }
    
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var personLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "toMainPage", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getBasket()
        getTotalPrice()
        changeLabel()
        
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
                            print(self.basketArray)
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
    
    func changeLabel(){
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser?.email
        let docRef = db.collection("Users").document(user!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let name = document.get("Ad") as? String {
                    if let surname = document.get("Soyad") as? String {
                        self.personLabel.text = "Welcome \(name) \(surname) "
                    }
                }
            } else {
                print("Belge yok")
            }
        }


            
        
    }
       
}
   
    
    

 


