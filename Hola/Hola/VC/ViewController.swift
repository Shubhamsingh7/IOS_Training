//
//  ViewController.swift
//  Hola
//
//  Created by Apple on 27/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import GoogleSignIn



class ViewController: UIViewController {
    
    
    @IBOutlet weak var fbLoginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
         GIDSignIn.sharedInstance().delegate = self
        
        //Mark : - Google Sign in
//
        GIDSignIn.sharedInstance()?.presentingViewController = self
//
//        // Automatically sign in the user.
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn()

        
        
    }


    @IBAction func googleLoginTapped(_ sender: AnyObject) {
     
        GIDSignIn.sharedInstance()?.signIn()

    }
    @IBAction func fbLoginTapped(_ sender: UIButton) {

        

        
    }
}

extension ViewController:GIDSignInDelegate{
    
    
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
        
        //        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let fullName = user.profile.name
        let email = user.profile.email
        
//        print(user.profile.hasImage)
        
        
        let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCViewController") as! HomeVCViewController
        
        home.email = email!
        home.id = userId!
        home.name = fullName!
        self.navigationController?.pushViewController(home, animated: true)
        


    }
    
    
}
