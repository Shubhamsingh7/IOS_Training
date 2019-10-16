//
//  RandomUserModel.swift
//  Hola
//
//  Created by Apple on 28/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

struct User{
    var fullName:Name
    var location:Location
    var email:String
    var gender:String
    var age:Int
    var phone:String
    
}

struct Name{
    var title:String
    var first:String
    var last:String
}

struct Location {
    var street:String
    var city:String
    var state:String
}
