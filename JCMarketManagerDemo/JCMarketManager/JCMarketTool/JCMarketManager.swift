
import UIKit

class JCMarketManager: NSObject {
    
    // MARK: - Defined Attribute
    
    // MARK: - Init Method
    
    static let showJCMarketManagerInstance = JCMarketManager()
    
    private override init() {
        
        super.init()
    }
    
    // MARK: - InitData
    
    func initData() {
        
    }
    
    // MARK: - Config Data
    
    // MARK: - Event Response
    
    // MARK: - NSNotificationCenter Method
    
    // MARK: - other Method
    
    // 根据具体的类型获取具体配置(返回元组类型)
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
    
    // 获取适配比例
    private func getScale(marketSizeType: JKMarketSizeType)->Double {
        
        let sizeInfo = self.getInfoWithMarketSizeType(marketSizeType: marketSizeType)
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
    
    // 转换适配尺寸
    public func translationSize(pxSize: Float, marketSizeType: JKMarketSizeType)->Double {
        
        let newPxSize = pxSize/Float(kScale)
        var translationSize = 0.0
        let scaleSize = self.getScale(marketSizeType: marketSizeType)
        
        translationSize = scaleSize * Double(newPxSize);
        return translationSize;
    }
    
    public func saveUserdefule(value: Any?, forKey: String) {
        
        UserDefaults.standard.set(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    public func getUserdefule(forKey: String)->Any? {
        
        return UserDefaults.standard.object(forKey: forKey)
    }
    
    // MARK: - Getters & Setters
    
    // MARK: - Deinit Method
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - System Delegate

// MARK: - Custom Delegate

//extension JCMarketManager: CustomDelegateName {
//    
//}
