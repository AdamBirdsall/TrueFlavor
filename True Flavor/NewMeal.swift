//
//  NewMeal.swift
//  True Flavor
//
//  Created by Adam Birdsall on 10/30/17.
//  Copyright © 2017 Adam Birdsall. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct NewMeal {
    
    let name: String
    var description: String
    var price: String
    
    let ref: FIRDatabaseReference?
    
    init(description: String, price: String, name: String = "") {
        
        self.name = name
        self.description = description
        self.price = price
        
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        name = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        description = snapshotValue["Description"] as! String
        price = snapshotValue["Price"] as! String
        
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        
        return [ name : [
                "description" : description,
                "price" : price
            ]
        ]
    }
}
