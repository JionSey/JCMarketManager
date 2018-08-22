//
//  JCMarketTool.swift
//  ZhiShiLvDongMasterIOS
//
//  Created by Jackie on 2018/7/24.
//  Copyright © 2018年 Jackie. All rights reserved.
//

import UIKit

public func getMarketSize(marketSizeType: JKMarketSizeType, width: Float)->CGFloat {
    return CGFloat(JCMarketManager.showJCMarketManagerInstance.translationSize(pxSize: width, marketSizeType: marketSizeType))
}

// 适配4设计尺寸机型
postfix operator ~*
postfix public func ~* (width: Float)->CGFloat {
    return getMarketSize(marketSizeType: JKMarketSizeType.JKMarketSizeTypeFour, width: width)
}

// 适配6设计尺寸机型
postfix operator ~~
postfix public func ~~ (width: Float)->CGFloat {
    return getMarketSize(marketSizeType: JKMarketSizeType.JKMarketSizeTypeSix, width: width)
}

// 适配6p设计尺寸机型
postfix operator ~&
postfix public func ~& (width: Float)->CGFloat {
    return getMarketSize(marketSizeType: JKMarketSizeType.JKMarketSizeTypePlus, width: width)
}


