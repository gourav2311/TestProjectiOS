//
//  ArticleModel.swift
//  TestApp
//
//  Created by Gourav on 28/12/18.
//  Copyright © 2018 gourav jaiswal. All rights reserved.
//

import Foundation
import  SwiftyJSON

struct Article {
    let imageURL: String
    let urlToImage: String
    let title: String
    
    
    init(fromJSON json: JSON) {
        imageURL = json["url"].stringValue
        title = json["title"].stringValue
        urlToImage = json["urlToImage"].stringValue
        
    }
}
