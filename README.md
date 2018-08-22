### swift 适配工具类JCMarketManager

###### 书写app页面的时候，经常需要使用比例来进行部分特殊场景界面的适配。界面适配工具JCMarketManager，结合了swift的运算符的特性，使使用更加便利和易用。
###### 传送门: [git地址](https://github.com/JionSey/JCMarketManager.git)
***

###1.架构组成及部分功能代码介绍

* JCMarketManager        包含适配管理类的主要方法
* JCMarketDefine         包含主要的适配常量及枚举
* JCMarketTool           业务工具类，在此文件中进行公用方法的定义

###### JCMarketManager：实现了适配工具类的主要功能
（1）根据具体的类型获取具体配置(返回元组类型)

````
public func getInfoWithMarketSizeType(marketSizeType: JKMarketSizeType)->(width: Double, keyName: String) {

var info = (0.0, "");
switch marketSizeType {
case .JKMarketSizeTypeFour:
info = (kIphone4Width, kIphone4SaveName)
case .JKMarketSizeTypeSix:
info = (kIphone6Width, kIphone6SaveName)
case .JKMarketSizeTypePlus:
info = (kIphone6PWidth, kIphone6PSaveName)
}
return info;
}

````

（2）获取适配比例（因为工程中可能会进行大量适配，所以使用缓存记录尺寸比例，减少性能损耗）

````
private func getScale(marketSizeType: JKMarketSizeType)->Double {

let sizeInfo = self.getInfoWithMarketSizeType(marketSizeType:   marketSizeType)
let saveScale = self.getUserdefule(forKey: sizeInfo.keyName)
if saveScale != nil {
return saveScale as! Double
} else {
let screenSize = UIScreen.main.bounds.size;
let screenWidth = screenSize.width;
let scaleSize = Double(screenWidth) / Double(sizeInfo.width)
self.saveUserdefule(value: scaleSize, forKey: sizeInfo.keyName)
return scaleSize
}
}

````

（3）转换适配尺寸

````
public func translationSize(pxSize: Float, marketSizeType: JKMarketSizeType)->Double {

let newPxSize = pxSize/Float(kScale)
var translationSize = 0.0
let scaleSize = self.getScale(marketSizeType: marketSizeType)

translationSize = scaleSize * Double(newPxSize);
return translationSize;
}

````

###### JCMarketDefine  包含主要的适配常量及枚举

````
// 屏幕类型尺寸枚举
public enum JKMarketSizeType {
case JKMarketSizeTypeFour
case JKMarketSizeTypeSix
case JKMarketSizeTypePlus
}

// 屏幕实际尺寸
public let kIphone4Width   = 320.0
public let kIphone6Width   = 375.0
public let kIphone6PWidth  = 414.0

// save key
public let kIphone4SaveName  = "kIphone4SaveName"
public let kIphone6SaveName  = "kIphone6SaveName"
public let kIphone6PSaveName = "kIphone6PSaveName"

// 设计比例
public let kScale  = 1.0

````

注：设计比例的设置需要根据公司设计师对设计稿的设计来定，因为公司设计稿的大小是1:1的所以这里为1.0

###### JCMarketTool 业务工具类，在此文件中进行公用方法的定义

````
// 适配公共类
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

````
注：将业务代码剥离出来，在使用的时候可快速实现方法替换。如果觉得该工具有问题只需修改适配公共类的方法即可，达到快速修复问题的目的。使用swift运算符重载，使使用更加便捷易用。

###2.测试
（1）在vc中使用测试代码

````
let test5Width = 320~*
print(test5Width)

let test6Width = 375~~
print(test6Width)

let test6pWidth = 414~&
print(test6pWidth)

````

（2）运行结果

````
// 5  下运行结果均为 320.0
// 6  下运行结果均为 375.0
// 6P 下运行结果均为 414.0

// 所以只要指定对应设计稿
// 在各个手机下显示的也就全按照比例适配了

````

###3.结语
###### 使用该工具可快速适配屏幕尺寸比例，无耦合。大家在使用中有任何问题可联系我，如果觉得还不错记得给一颗星哦。


