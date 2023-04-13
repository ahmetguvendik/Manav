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
        let cell = UITableViewCell()
        cell.textLabel?.text = basketArray[indexPath.row].productName
        return cell
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getBasket()

        // Do any additional setup after loading the view.
    }
    
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
                                        let baskets = Basket(productName: productName, productPrice: price)
                                        self.basketArray.append(baskets)
                                    }
                            self.tableView.reloadData()
                        }
                            }
                        }
                    }
                }
            }
        }
   
    
    

 


