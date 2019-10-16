//
//  ViewController.swift
//  Social Logins
//
//  Created by Apple on 26/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
//import FBSDKLoginKit
//import FBSDKCoreKit
import FacebookLogin
import GoogleSignIn
import GoogleSignIn.GIDSignInButton

class ViewController: UIViewController{

    
    
    let loginButton:FBLoginButton = {
        let button = FBLoginButton()
        button.permissions = ["email"]
        return button
    }()
    
    
    @IBOutlet weak var signWithGoogle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            print("User is already login")

        }
        
         GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        
        view.addSubview(loginButton)
        loginButton.center = view.center
//        loginButton.delegate = self
        
  
        
        let loginButton = FBLoginButton(permissions: [ .publicProfile, .email, .userFriends
            ])

        loginButton.center = view.center
        
        
        
        
        view.addSubview(loginButton)
    }
    

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        // ...
    }
    
    
    @IBAction func google(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance()?.signIn()
        
//        // Automatically sign in the user.
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
   
    
    func loginButtonWillLogin(_ loginButton: FBLoginButton) -> Bool {
        return true
    }
    


}

