//
//  LaundryHall.swift
//  LaundryTester
//
//  Created by Zhilei Zheng on 2017/10/24.
//  Copyright © 2017年 Zhilei Zheng. All rights reserved.
//

import Foundation
import SwiftyJSON

class LaundryHall {
    
    // fields, get() by laundryHall.fieldName, set() only available through network calls
    public private(set) var id:Int
    public private(set) var name:String
    public private(set) var numWasherOpen:Int
    public private(set) var numWasherRunning:Int
    public private(set) var numWasherOutOfOrder:Int
    public private(set) var numWasherOffline:Int
    public private(set) var remainingTimeWashers:[Int?]
    public private(set) var numDryerOpen:Int
    public private(set) var numDryerRunning:Int
    public private(set) var numDryerOutOfOrder:Int
    public private(set) var numDryerOffline:Int
    public private(set) var remainingTimeDryers:[Int?]
    
    // instantiation
    init(json:JSON, id:Int) {
        self.id = id
        self.name = json["hall_name"].string ?? "Unknown"
        let washers:JSON = json["machines"]["Washers"]
        let dryers:JSON = json["machines"]["Dryers"]
        self.numWasherOpen = washers["open"].intValue
        self.numWasherRunning = washers["running"].intValue
        self.numWasherOutOfOrder = washers["out_of_order"].intValue
        self.numWasherOffline = washers["offline"].intValue
        self.numDryerOpen = dryers["open"].intValue
        self.numDryerRunning = dryers["running"].intValue
        self.numDryerOutOfOrder = dryers["out_of_order"].intValue
        self.numDryerOffline = dryers["offline"].intValue
        self.remainingTimeWashers = []
        if let arr = washers["time_remaining"].arrayObject {
            for time in arr {
                remainingTimeWashers.append(time as? Int)
            }
        }
        self.remainingTimeDryers = []
        if let darr = dryers["time_remaining"].arrayObject {
            for time in darr {
                remainingTimeDryers.append(time as? Int)
            }
        }
    }
    
    // get the time for next open washer in String format
    // returns "now" if there are open washers
    func getNextOpenWasher() -> String{
        if self.numWasherOpen != 0 {
            return "now"
        } else {
            var time:Int = 1000
            for t in remainingTimeWashers{
                if let remain = t {
                    if remain < time{
                        time = remain
                    }
                }
            }
            return "In \(time) min"
        }
    }
    
    // get the time for next open dryer in String format
    // returns "now" if there are open dryers
    func getNextOpenDryer() -> String{
        if self.numDryerOpen != 0 {
            return "now"
        } else {
            var time:Int = 1000
            for t in remainingTimeDryers{
                if let remain = t {
                    if remain < time{
                        time = remain
                    }
                }
            }
            return "In \(time) min"
        }
    }
    
    
    // below are functions for testing this demo app.
    // Maybe useful to consider
    func printStringInfo(){
        print ("name:\(self.name), \(self.numWasherOpen) washers open, \(self.numDryerOpen) dryers open")
    }
    
    func getWasherStatus() -> String{
        return "\(numWasherOpen) Open,\(numWasherRunning) Running, \(numWasherOutOfOrder) Out,\(numDryerOffline) Off"
    }
    
    func getDryerStatus() -> String{
        return "\(numDryerOpen) Open,\(numDryerRunning) Running, \(numDryerOutOfOrder) Out,\(numDryerOffline) Off"
    }
    
    func getRunningWashers() -> String{
        return "Running Washers: \(remainingTimeWashers)"
    }
    
    func getRunningDryers() -> String{
        return "Running Dryers: \(remainingTimeDryers)"
    }
    
    
}
