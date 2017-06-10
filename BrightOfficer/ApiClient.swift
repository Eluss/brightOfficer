//
//  ApiClient.swift
//  BrightOfficer
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiClient {
    
    let host = "http://35.187.160.105"
    let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU5M2FlMTBkMTEwYzk0MDBhNjc3ZjBlZiIsImlhdCI6MTQ5NzAzMTAwMn0.Sn-32cieaiAmVYuJE4R2wflqD53ZlQpg9-zbZGZSBkc"
    
    static let sharedInstance = ApiClient()
    
    func urlWithAccessToken(url: String) -> String {
        return url + "?access_token=" + accessToken
    }
    
    func getCalls(onCallsReceived: @escaping ([Call])->Void) {
        let url = URL(string: host + urlWithAccessToken(url: "/calls"))!
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            let calls = Mapper<Call>().mapArray(JSONArray: response.result.value! as! [[String : Any]])
            onCallsReceived(calls!)
        }
    }
    
    func nextStep(id: String, callback: @escaping ()->()) {
        let parameters = [
            "access_token": accessToken
            ] as [String : Any]
        
        let url = URL(string: host + urlWithAccessToken(url: "/calls/" + id + "/nextStep"))!
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).response { (response) in
            callback()
        }
    }
}
