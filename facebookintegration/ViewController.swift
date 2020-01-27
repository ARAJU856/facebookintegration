//
//  ViewController.swift
//  facebookintegration
//
//  Created by A RAJU on 1/21/20.
//  Copyright © 2020 A RAJU. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FacebookShare

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let loginButton = FBLoginButton(permissions: [ .publicProfile,.userFriends,.userVideos])
//             loginButton.center = view.center
//
//             view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }
    
 
    func loginManagerDidComplete(_ result: LoginResult) {
         let alertController: UIAlertController
         switch result {
         case .cancelled:

          alertController = UIAlertController(title: "Login Cancelled", message: "User cancelled login.", preferredStyle: UIAlertController.Style.alert)
          
         case .failed(let error):
             
          
            alertController = UIAlertController(title: "Login Fail", message: "Login failed with error \(error)", preferredStyle: UIAlertController.Style.alert)

         case .success(let grantedPermissions, _, _):
             
          
          var pvc = self.storyboard?.instantiateViewController(identifier: "MainNC")
          
          present(pvc!, animated: true, completion: nil)
          
          //alertController = UIAlertController(title: "Login Success", message: "Login succeeded with granted permissions: \(grantedPermissions)", preferredStyle: UIAlertController.Style.alert)
          
         }
         //self.present(alertController, animated: true, completion: nil)
     }
      
      
      @IBAction func onLoginBtnTap(_ sender: Any)
      {
          let loginManager = LoginManager()
          loginManager.logIn(
            permissions: [.publicProfile, .userFriends,.userVideos],
              viewController: self
          ) { result in
              self.loginManagerDidComplete(result)
          }
          
      }
      
      
      @IBAction func onLogOutBtnTap(_ sender: Any) {
          
          let loginManager = LoginManager()
          loginManager.logOut()

          let alertController = UIAlertController(title: "Logout", message: "Logged out Successfully", preferredStyle: UIAlertController.Style.alert)
          present(alertController, animated: true, completion: nil)
      }
      

    

}

