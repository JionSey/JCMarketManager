//
//  JCMarketDefine.swift
//  ZhiShiLvDongMasterIOS
//
//  Created by Jackie on 2018/7/24.
//  Copyright © 2018年 Jackie. All rights reserved.
//

import UIKit

public enum JKMarketSizeType {
    case JKMarketSizeTypeFour
    case JKMarketSizeTypeSix
    case JKMarketSizeTypePlus
}

public let kScale  = 1.0

public let kIphone4Height  = 480.0
public let kIphone5Height  = 568.0
public let kIphone6Height  = 667.0
public let kIphone6PHeight = 736.0
public let kIphoneXHeight  = 812.0

public let kIphone4Width   = 320.0
public let kIphone6Width   = 375.0
public let kIphone6PWidth  = 414.0

public let kIphone4SaveName  = "kIphone4SaveName"
public let kIphone6SaveName  = "kIphone6SaveName"
public let kIphone6PSaveName = "kIphone6PSaveName"

public func saveUserdefule(value: Any?, forKey: String) {
    
    UserDefaults.standard.set(value, forKey: forKey)
    UserDefaults.standard.synchronize()
}

public func getUserdefule(forKey: String)->Any? {
    
    return UserDefaults.standard.object(forKey: forKey)
}


