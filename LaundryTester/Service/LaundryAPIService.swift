//
//  LaundryAPIService.swift
//  LaundryTester
//
//  Created by Zhilei Zheng on 2017/10/24.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import Foundation
import SwiftyJSON

class LaundryAPIService: Requestable {
    
    static let instance = LaundryAPIService()
    
    private let laundryUrl = "https://api.pennlabs.org/laundry/hall/"
    
    // call passing 1 id to API
    func getHall(for id: Int, callback: @escaping ((LaundryHall?) -> ())) {
        let url = laundryUrl + "\(id)"
        getRequest(url: url) { (dictionary) in
            if let dict = dictionary {
                let json = JSON(dict)
                let laundryHall = LaundryHall(json: json, id: id)
                callback(laundryHall)
            } else {
                callback(nil)
            }
        }
    }
    
    // call passing 2 ids to API
    func getHalls(for id1: Int, id2: Int, callback: @escaping ((LaundryHall?, LaundryHall?) -> ())) {
        let url = laundryUrl + "\(id1)/\(id2)"
        getRequest(url: url) { (dictionary) in
            if let dict = dictionary {
                let json = JSON(dict)
                if let hallArray = json["halls"].array{
                    let laundryHall1 = LaundryHall(json: hallArray[0], id: id1)
                    let laundryHall2 = LaundryHall(json: hallArray[1], id: id2)
                    callback(laundryHall1, laundryHall2)
                }
            } else {
                callback(nil, nil)
            }
        }
    }
}


