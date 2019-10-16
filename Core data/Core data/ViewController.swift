//
//  ViewController.swift
//  Core data
//
//  Created by Apple on 08/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UserDefaultDataSaving().savingUserData()
        UserDefaultDataSaving().getData()
    }


}

