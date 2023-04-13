//
//  MainViewController.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 11.04.2023.
//

import UIKit
import Firebase

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableView",for: indexPath) as! ProductTableViewCell
        cell.productNameLabel.text = self.productArray[indexPath.row].name
        cell.priceLabel.text = "\(self.productArray[indexPath.row].price)"
        return cell
    }
    
    
    @IBAction func basketButton(_ sender: Any) {
        performSegue(withIdentifier: "toBasketPage", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getProduct()
    }
    

    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toSignInPage", sender: nil)
            
        } catch {
            print("HATA")
        }
    }
    

    var productArray = [Product]()
    func getProduct(){
        let db = Firestore.firestore()
        db.collection("Product").addSnapshotListener { query, error in
            if error == nil {
                if query?.isEmpty == false {
                   self.productArray.removeAll(keepingCapacity: true)
                    for datas in query!.documents{
                        if let productName = datas.get("Name") as? String {
                            if let price = datas.get("Price") as? String {
                                if let stock = datas.get("Stock") as? String {
                                    if let brand = datas.get("Brand") as? String {
                                        let products = Product(name: productName, brand: brand, stock: stock, price: price)
                                        self.productArray.append(products)
                                    }
                            }
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
}
