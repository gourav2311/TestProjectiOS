//
//  ViewController.swift
//  TestApp
//
//  Created by gourav jaiswal on 26/12/18.
//  Copyright © 2018 gourav jaiswal. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

import UserNotifications


class Utilities{
    

    
    //MARK: NETWORK REACHABILITY
    static func startNetworkReachabilityObserver() -> Bool{
        
        guard let manager = NetworkReachabilityManager(host: "www.apple.com") else {
            
            return false
        }
        manager.startListening()
        if manager.isReachable == false{
            
            if(ShawPulseLoaderView.sharedInstance.isAnimating){
                ShawPulseLoaderView.sharedInstance.stopShawLogoIndicator()
                UIApplication.shared.endIgnoringInteractionEvents()
                
            }
        }
        ShawAnalytics.sharedInstance.logEvent(logName: "NetworkReachability \(manager.isReachable.hashValue)")

        return manager.isReachable
        
    }
    
    static func customErrorAlertView (errorTitle:String, errorMessage:String, errorButtonTitle: String) -> UIAlertController{
        
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: errorButtonTitle, style: UIAlertActionStyle.default, handler: nil))
        return alert
        
        //self.present(alert, animated: true, completion: nil)
    }
    
    
    
    }
    



