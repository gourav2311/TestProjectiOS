//
//  ViewController.swift
//  TestApp
//
//  Created by gourav jaiswal on 26/12/18.
//  Copyright © 2018 gourav jaiswal. All rights reserved.
//
import Foundation



struct UserDetail {
    var userName: String
    var userID: String
}
struct LoginAnalyticsDetails {
    var email : String
    var isSuccess : Bool
    var deviceType : String
    var deviceOS : String
    var failureReason : String?
    
    init(email: String, isSuccess: Bool, deviceType: String, deviceOS: String) {
        self.email = email
        self.isSuccess = isSuccess
        self.deviceType = deviceType
        self.deviceOS = deviceOS
    }
}

class ShawAnalytics{
    
    private let serialQueue = DispatchQueue(label: "com.shawacademy.analytics.segment")
   
    static let sharedInstance: ShawAnalytics = {

        return ShawAnalytics()
    }()
    
    func logEvent(logName : String){
        serialQueue.async{
           
        }
    }
   
   
    
    
}
