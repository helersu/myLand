//
//  ViewController.swift
//  myLand
//
//  Created by cybersoft on 29/01/2018.
//  Copyright © 2018 reklammakinasi. All rights reserved.
//

import UIKit
import Firebase

//var ref : DatabaseReference!


class ViewController: UIViewController {
    
   

    @IBAction func loginButton(_ sender: UIButton) {
       
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                if let errCode = AuthErrorCode(rawValue: error!._code){
                    switch errCode {
                    case .wrongPassword:
                        self.warningLabel.text = "wrong username/password"
                    case .invalidEmail:
                        self.warningLabel.text = "wrong username/password"
                    case .missingEmail:
                        self.warningLabel.text = "email address empty"
                    default:
                        self.warningLabel.text = "Sonething goes wrong!"
                    }
                }
                else{
                    self.performSegue(withIdentifier: "goToMain", sender: self)
                }
            }
            
            
        }
        
        
    }
 

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ref = Database.database().reference()
        //ref.child("myKeys").setValue(testInput.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






