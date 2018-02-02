//
//  CreateUser.swift
//  myLand
//
//  Created by cybersoft on 29/01/2018.
//  Copyright © 2018 reklammakinasi. All rights reserved.
//

import UIKit
import Firebase


class CreateUser: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passwordFirst: UITextField!
    @IBOutlet weak var passwordSecond: UITextField!
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToLogin", sender: self)
        
    }
    @IBAction func registerButton(_ sender: UIButton) {
        
        if passwordFirst.text == passwordSecond.text{
            //try to register user
            Auth.auth().createUser(withEmail: email.text!, password: passwordFirst.text!, completion: { (user, error) in
                if error != nil{
                    if let errCode = AuthErrorCode(rawValue: error!._code){
                        switch errCode {
                            case .invalidEmail:
                            self.warningLabel.text = "Invalid email address..."
                            case .emailAlreadyInUse:
                            self.warningLabel.text = "Your email address already in use"
                            case .weakPassword:
                            self.warningLabel.text = "Password requirement min. 6 charcter"
                            
                        default:
                            self.warningLabel.text = "Something going wrong"
                            
                        }
                    }
                }
                else{
                    
                    self.email.text = ""
                    self.passwordFirst.text = ""
                    self.passwordSecond.text = ""
                    self.warningLabel.text = "Registration Successfull"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                        self.performSegue(withIdentifier: "goToLogin", sender: self)
                    })
                    
                }
                
                
                
            })
        }
        else{
            warningLabel.text = "Passwords mismatch."
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
