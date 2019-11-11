
//
//  Api.swift
//  shawacademyv1
//
//  Created by BOJJA MANOJ on 03/12/16.
//  Copyright © 2016 SHAW ACADEMY. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api{
    
    var apiUrl = String()
    let requestTimeOut = TimeInterval(30)
    init(){
        self.apiUrl = Config.baseURL
    }
    
    
    
    func apiCall(section: String,completionHandler: @escaping (NSDictionary?, NSError?) -> ()){
        makeCall( section: section, completionHandler: completionHandler)
    }
    
  
    
    // This is an UnAuth post call////////////////////
    func makeCall( section: String, completionHandler: @escaping (NSDictionary?, NSError?) -> ()) {
        
        do {
//            let params = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)

            
            var request = URLRequest(url: NSURL.init(string: "\(Config.baseURL)")! as URL)
            request.httpMethod = "GET"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.addValue("application/json", forHTTPHeaderField: "Accept")
//            request.addValue("application/json", forHTTPHeaderField: "Accept-Encoding")
            request.timeoutInterval = 10
            
            //request.httpBody = params
            
            Alamofire.request(request) .validate(contentType: ["application/json"]).responseJSON { (response:DataResponse<Any>) in
                switch response.result {
                case .success(let value):
                    completionHandler(value as? NSDictionary, nil)
                case .failure(let error):
                    completionHandler(nil, error as NSError?)
                }
            }
        } catch {
            completionHandler(nil, error as NSError?)
        }
    }
    
    
   
}

extension Api{

    func retry<T>(_ attempts: Int, task: @escaping (_ success: @escaping (T) -> Void, _ failure: @escaping (Error) -> Void) -> Void, success: @escaping (T) -> Void, failure: @escaping (Error) -> Void) {
        task({ (obj) in
            success(obj)
        }) { (error) in
            print("Error retry left \(attempts)")
            if attempts > 1 {
                self.retry(attempts - 1, task: task, success: success, failure: failure)
            } else {
                failure(error)
            }
        }
    }
}

