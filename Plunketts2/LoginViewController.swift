//
//  LoginViewController.swift
//  Plunketts2
//
//  Created by Eanna Boland on 25/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit
import FBSDKCoreKit


class LoginViewController: UIViewController   {
    
    
    @IBOutlet weak var loginGIF: UIImageView!
    @IBOutlet weak var facebookButton: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        loginGIF.loadGif(name: "Clubhouse5secs")

        


            }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of Facebook")
    }
    
    
    //Facebook login
    @IBAction func facebookButton(_ sender: Any) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                    self.nextScreen()
                }
            }
        }
        
    }
    
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    print(result!)
                }
            })
        }
    }
    
    
    func nextScreen() {

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Nav") as! UINavigationController
        self.present(nextViewController, animated:true, completion:nil)
        }
}


    

    

