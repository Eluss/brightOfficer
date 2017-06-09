//
//  User.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper

class User: Mappable {
    
    var id: String = ""
    var name: String = ""
    var picture: String = ""
    var location: CLLocationCoordinate2D?
    var phoneNumber: String = ""
    var weight: Double = 0.0
    var info: String = ""
    var status: String = ""
    
    init(name: String, picture: String, location: CLLocationCoordinate2D, phoneNumber: String, weight: Double, info: String) {
        self.name = name
        self.picture = picture
        self.location = location
        self.phoneNumber = phoneNumber
        self.weight = weight
        self.info = info
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        picture <- map["picture"]
        phoneNumber <- map["phoneNumber"]
        weight <- map["weight"]
        info <- map["info"]
        let params: [Double] = map.JSON["location"] as! [Double]
        let coords = CLLocationCoordinate2D(latitude: params[1], longitude: params[0])
        location = coords
    }
    
}
