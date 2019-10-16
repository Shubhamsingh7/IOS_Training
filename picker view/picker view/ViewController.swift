//
//  ViewController.swift
//  picker view
//
//  Created by Apple on 24/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    let state = ["Andra Pradesh","Uttar Pradesh","Madhya Pradesh","Rajasthan","Haryana","Punjab","Tamil Nadu","Uttarakhand","Himachal Pradesh","Bihar","Jharkhand","Chattishgarh","Maharashtra","Karnataka","Kerala","Telangana","West Bengal","Udisha","Gujrat","Manipur","Arunchal Pradesh","Nagaland","Mizoram","Meghalaya","Tripura","Aasam"]
    
//    let state = [ "AK - Alaska",
//                  "AL - Alabama",
//                  "AR - Arkansas",
//                  "AS - American Samoa",
//                  "AZ - Arizona",
//                  "CA - California",
//                  "CO - Colorado",
//                  "CT - Connecticut",
//                  "DC - District of Columbia",
//                  "DE - Delaware",
//                  "FL - Florida",
//                  "GA - Georgia",
//                  "GU - Guam",
//                  "HI - Hawaii",
//                  "IA - Iowa",
//                  "ID - Idaho",
//                  "IL - Illinois",
//                  "IN - Indiana",
//                  "KS - Kansas",
//                  "KY - Kentucky",
//                  "LA - Louisiana",
//                  "MA - Massachusetts",
//                  "MD - Maryland",
//                  "ME - Maine",
//                  "MI - Michigan",
//                  "MN - Minnesota",
//                  "MO - Missouri",
//                  "MS - Mississippi",
//                  "MT - Montana",
//                  "NC - North Carolina",
//                  "ND - North Dakota",
//                  "NE - Nebraska",
//                  "NH - New Hampshire",
//                  "NJ - New Jersey",
//                  "NM - New Mexico",
//                  "NV - Nevada",
//                  "NY - New York",
//                  "OH - Ohio",
//                  "OK - Oklahoma",
//                  "OR - Oregon",
//                  "PA - Pennsylvania",
//                  "PR - Puerto Rico",
//                  "RI - Rhode Island",
//                  "SC - South Carolina",
//                  "SD - South Dakota",
//                  "TN - Tennessee",
//                  "TX - Texas",
//                  "UT - Utah",
//                  "VA - Virginia",
//                  "VI - Virgin Islands",
//                  "VT - Vermont",
//                  "WA - Washington",
//                  "WI - Wisconsin",
//                  "WV - West Virginia",
//                  "WY - Wyoming"]
//
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self

    }
    @IBOutlet weak var label: UILabel!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return state.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return state[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = state[row]
    }
    

}

