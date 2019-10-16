//
//  UserDefaultDataSave.swift
//  Core data
//
//  Created by Apple on 08/10/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation


class UserDefaultDataSaving{
    let data = UserDefaults.standard
    func savingUserData(){
        
        
        let employee = Employee(
            id: "AI780",
            name: "Shubham Singh",
            age: 23,
            spouse: nil
        )
        
        data.set(employee.age, forKey: Key.age.rawValue)
        data.set(employee.name, forKey: Key.name.rawValue)
        data.set(employee.id, forKey: Key.id.rawValue)
        data.set(employee.spouse, forKey: Key.spouse.rawValue)
        
        
    }
    
    
    func getData(){
        print( data.value(forKey: Key.name.rawValue) as? String ?? "")
        print( data.value(forKey: Key.age.rawValue) as? Int ?? 0)
        print( data.value(forKey: Key.id.rawValue) as? String ?? "")
        print( data.value(forKey: Key.spouse.rawValue) as? String ?? "")
        
    }

}
