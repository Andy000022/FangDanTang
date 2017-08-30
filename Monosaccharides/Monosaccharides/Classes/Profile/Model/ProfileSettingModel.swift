//
//  ProfileSettingModel.swift
//  Monosaccharides
//
//  Created by iSolar on 2017/8/18.
//  Copyright © 2017年 nothing. All rights reserved.
//

import UIKit

class ProfileSettingModel: NSObject {

    var iconImage: String?
    
    var leftTitle: String?
    
    var rightTitle: String?
    
    var isHiddenSwitch: Bool?
    
    var isHiddenRightTip: Bool?
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        iconImage = dict["iconImage"] as? String
        
        leftTitle = dict["leftTitle"] as? String
        
        rightTitle = dict["rightTitle"] as? String
        
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        
        isHiddenRightTip = dict["isHiddenRightTip"] as? Bool
        
    }
    
}
