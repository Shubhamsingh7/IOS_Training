//
//  File.swift
//  Core data
//
//  Created by Apple on 08/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation


class Employee{
    var id:String
    var name:String
    var age:Int
    var spouse:Employee?
    
    public init(id:String,name:String,age:Int,spouse:Employee?){
        self.age = age
        self.id = id
        self.name = name
        self.spouse = spouse
    }
    
}

enum Key:String{
    case id,name,age,spouse
}


