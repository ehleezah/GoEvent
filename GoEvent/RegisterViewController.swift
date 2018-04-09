//
//  RegisterViewController.swift
//  GoEvent
//
//  Created by Logan on 3/28/18.
//  Copyright © 2018 Logan. All rights reserved.
//

import UIKit
import RealmSwift


class RegisterViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
   
    var user1 = user()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name.delegate = self
        self.email.delegate = self
        self.password.delegate = self
        
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        if  (name.text?.isEmpty)!{
            
            let alert = UIAlertController(title: "Sorry!", message: "Please enter your name!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        else if (email.text?.isEmpty)! {
            
            let alert = UIAlertController(title: "Sorry!", message: "Please enter your email!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        else if (password.text?.isEmpty)! {
            
            let alert = UIAlertController(title: "Sorry!", message: "Please enter your password!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
        else {
        
            user1.name = name.text!
            user1.password = password.text!
            user1.email = email.text!
            
            do {
                let realm = try Realm()
                try realm.write() {
                    realm.add(user1)
                }
                
            }
            catch {
                print(error.localizedDescription)
            }
            
        let mySC = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventViewController") as! CreateEventViewController
        
        self.navigationController?.pushViewController(mySC, animated: true)
        }
        
    }
}
