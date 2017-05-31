//
//  AppDelegate.swift
//  Plunketts2
//
//  Created by Eanna Boland on 06/05/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit
import FBSDKCoreKit
import Firebase
import GoogleSignIn


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Twitter integration
        Fabric.with([Twitter.self])
        
        //Firebase integration
        FirebaseApp.configure()
        
        
        
      
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        //Facebook integration
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //Keep me logged in
        /*let isUserLoggedIn:Bool = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        if(isUserLoggedIn) {
            let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
            let protectedPage = mainStoryboard.instantiateViewControllerWithIdentifier("FixtureList") as! FixtureListViewController
            window!.rootViewController = protectedPage
            window!.makeKeyAndVisible()
        }*/
        
        //Background colour of nav bar
        UINavigationBar.appearance().barTintColor = UIColor(red: 41/255, green: 47/255, blue: 51/255, alpha: 1)
        UINavigationBar.appearance().isTranslucent = false
        
        
        //self.accessibilityNavigationStyle
        //UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        //navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        return true
    }


    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if (url.scheme!.isEqual("fb143450039533465")){
            return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        
        } else {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                              annotation: [:])
        }

 

    

    }
        /*
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)*/
        
        // Add any custom logic here.
      
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                
                if let window = self.window{
                    window.rootViewController?.present(alertController, animated: true, completion: nil)
                }
                
                return
            }
            
            // Present the main view
            self.nextScreen()
            
        }
    }
    
    
    func nextScreen() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Nav") as! UINavigationController
        if let window = self.window{
            window.rootViewController = nextViewController
        }
        
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

