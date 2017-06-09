//
//  ApiClient.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import Alamofire
class ApiClient {
    
    let host = "http://35.187.160.105"
    let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU5M2E4NGU0NmZkMzdjMDA5YzFmNjZkZiIsImlhdCI6MTQ5NzAwNzQxMn0.5WgPKL7pvksheDrv1r1Dox9to2eLRQtVMdD4YZ6jNRU"
    
    static let sharedInstance = ApiClient()
    
    func urlWithAccessToken(url: String) -> String {
        return url + "?access_token=" + accessToken
    }
    
    func getUsers() {
        let url = URL(string: host + urlWithAccessToken(url: "/calls"))!
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { response in
            debugPrint(response)
        }
    }

}
