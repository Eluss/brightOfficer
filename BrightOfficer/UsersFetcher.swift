//
//  UsersFetcher.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import CoreLocation

class UsersFetcher {
    
    func fetchUsers(onUsersFetched: (([User]) -> Void)) {
        onUsersFetched(fakeUsers())
    }
    
    func fakeUsers() -> [User] {
        let pic = "https://gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0?d=identicon"
        let user1 = User(name: "Mark Twain", picture: pic, location: CLLocationCoordinate2D(latitude: 1,longitude: 2), phoneNumber: "123456789", weight: 90, info: "Wózek inwalidzki")
        let user2 = User(name: "Danny Cowey", picture: pic, location: CLLocationCoordinate2D(latitude: 1,longitude: 2), phoneNumber: "123456789", weight: 85, info: "Foreign speaker")
        let user3 = User(name: "Paul Wiss", picture: pic, location: CLLocationCoordinate2D(latitude: 1,longitude: 2), phoneNumber: "123456789", weight: 70, info: "Wózek inwalidzki")
        let user4 = User(name: "Danny Core", picture: pic, location: CLLocationCoordinate2D(latitude: 1,longitude: 2), phoneNumber: "123456789", weight: 56, info: "Duża torba")
        let user5 = User(name: "Terry Patch", picture: pic, location: CLLocationCoordinate2D(latitude: 1,longitude: 2), phoneNumber: "123456789", weight: 120, info: "Wózek inwalidzki")
        let user6 = User(name: "Iggy Pial", picture: pic, location: CLLocationCoordinate2D(latitude: 1,longitude: 2), phoneNumber: "123456789", weight: 15, info: "Wózek inwalidzki")
        
        
        return [user1, user2, user3, user4, user5, user6]
    }
    
}
