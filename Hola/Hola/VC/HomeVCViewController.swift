//
//  homeVCViewController.swift
//  Hola
//
//  Created by Apple on 27/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeVCViewController: UIViewController {
 
    var name:String = ""
    var email:String = ""
    var id:String = ""
    
    var gender:String = ""
    var title:String = ""
    var fname = ""
    var lname = ""
    

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lebel2: UILabel!
    
    
    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    
//    var receivedData = [String: String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Mark:- Alomofire
        
        let apiUrl:String = "https://randomuser.me/api"
       
        AF.request(apiUrl).responseJSON { data in
         
            switch data.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                self.gender =  json["results"][0]["gender"].stringValue
                self.title = json["results"][0]["name"]["title"].stringValue
                self.fname = json["results"][0]["name"]["first"].stringValue
                self.lname = json["results"][0]["name"]["last"].stringValue
                var name = Name(title: self.title!, first: self.fname, last: self.lname)
            case .failure(let error):
                print(error)
            }
            
        }
        nameLabel.text = "Mr. "+name
        lebel2.text = "your email is is,"
        
        emailIdLabel.text = email
        
        idlabel.text = "id = "+id
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        print("right swipe")
        
        
    }
    

}
