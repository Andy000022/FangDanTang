//
//  HomeChannelModel.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class HomeChannelModel: NSObject {

    var editable: Bool?
    var id: Int?
    var name: String?
    
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
        
    }
    
    
}
