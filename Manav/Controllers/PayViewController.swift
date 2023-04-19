//
//  PayViewController.swift
//  Manav
//
//  Created by Ahmet GÜVENDİK on 17.04.2023.
//

import UIKit
import Firebase

class PayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        totalPriceLabel.text = "Total Price = \(totalPrice)"
        getBasket()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "toBasketPage", sender: nil)
    }
    
    var totalPrice = ""
    
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var adressTextField: UITextField!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var districtTextField: UITextField!
   
    var productList: [String] = []
    func getBasket(){
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser?.email
        db.collection("Baskets").document(currentUser!).collection("BasketProdcut").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let productName = document.data()["ProductName"] as! String
                    self.productList.append(productName)
                }
    
            }
        }

    }
   
    var orderArray = [Order]()
    @IBAction func createOrderButton(_ sender: Any) {
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser?.email
        if currentUser != nil {
            let uuid = UUID()
           
                let data = ["AdressText": adressTextField.text , "AdressTitle" : titleTextField.text , "AdressCity" : cityTextField.text , "AdressDistrict" : districtTextField.text , "TotalPrice" : totalPriceLabel.text ,"Products" : productList] as! [String : Any]
                db.collection("Orders").document(currentUser!).collection("OrderProduct").document(uuid.uuidString).setData(data)
            
            succesAlert(message: "Sipariş Başarılı Bir Şekilde Oluşturuldu")
        }
        
        
        
    }
    

    var alertController = UIAlertController()
    func succesAlert(message : String){
           alertController = UIAlertController(title: "Succes", message: message, preferredStyle: .alert)
           let okButton = UIAlertAction(title: "OK", style: .cancel)
           alertController.addAction(okButton)
           present(alertController, animated: true)
       }
}
