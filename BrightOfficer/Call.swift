//
//  Call.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import ObjectMapper

class Call: Mappable {
    
    var id: String = ""
    var status: String = ""
    var user: User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        status <- map["status"]        
        user <- map["user"]
    }
    
    
    
    
}
