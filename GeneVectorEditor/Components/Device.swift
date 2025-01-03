//
//  Device.swift
//  GeneVectorEditor
//
//  Created by Wang Zhengdong on 1/3/25.
//

import UIKit


enum Device {
    //MARK: 当前设备类型 iphone ipad mac
    enum Devicetype{
        case iphone,ipad,mac
    }
    
    static var deviceType:Devicetype{
#if os(macOS)
        return .mac
#else
        if  UIDevice.current.userInterfaceIdiom == .pad {
            return .ipad
        }
        else {
            return .iphone
        }
#endif
    }
}
