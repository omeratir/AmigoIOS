//
//  LoginViewController.swift
//  Amigo
//
//  Created by Guy Peleg on 06/01/2020.
//  Copyright © 2020 Shiran Klein. All rights reserved.
//

import UIKit
import FirebaseAuth
import ProgressHUD

protocol LoginViewControllerDelegate {
    func onLoginSuccess();
    func onLoginCancell();
}

class LoginViewController: UIViewController,RegiserDelegate {
    
 var delegate:LoginViewControllerDelegate?
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
       func onComplete(success: Bool) {
          print("on Complete signInOut \(success)")
                    if success == true {
                        print("on Complete signInOut success")
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let signInVC = storyboard.instantiateViewController(withIdentifier: "Home")
                        self.present(signInVC, animated: true, completion: nil)
                    }
        }
    
    
    @IBAction func Connect(_ sender: Any) {
      // ProgressHUD.show("Waiting...",interaction: false)
                 
        Auth.auth().signIn(withEmail: email.text!, password: password.text!,completion: { (authResult,error) in
            if ((authResult) != nil){
                               let storyboard = UIStoryboard(name: "Main", bundle: nil)
                               let signInVC = storyboard.instantiateViewController(withIdentifier: "Home")
                               self.present(signInVC, animated: true, completion: nil)
                               //                self.navigationController?.popViewController(animated: true);
                                if let delegate = self.delegate{
                                   delegate.onLoginSuccess()
                               }
                           }
             // self.onComplete(success: true)
                       })
  
    
//                         else {
//                             ProgressHUD.showError("fill all fields")
//                             return}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        let layer = CAGradientLayer()
        let color1 = UIColor(red:0.99, green: 0.48, blue: 0.48, alpha: 1.0)
        let color2 = UIColor(red:0.65, green: 0.76, blue: 1.00, alpha: 1.0)

        layer.colors = [ color1.cgColor ,color2.cgColor]
        layer.frame = view.frame
        view.layer.insertSublayer(layer, at: 0)

        
    
        // Do any additional setup after loading the view.
    }
    
    static func factory()->LoginViewController{
         return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Login")
     }

}
