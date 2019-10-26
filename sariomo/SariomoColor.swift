//
//  SariomoColor.swift
//  sariomo
//
//  Created by AIRU ISHIKURA on 2019/10/27.
//  Copyright © 2019 AIRU ISHIKURA. All rights reserved.
//

import Foundation
import UIKit

class MyColor : UIColor {
    @nonobjc class var pinkishGrey: UIColor {
        return UIColor(red: 190.0 / 255.0, green: 187.0 / 255.0, blue: 187.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var warmGrey: UIColor {
        return UIColor(white: 112.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var brownishGrey: UIColor {
        return UIColor(white: 104.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var tomato: UIColor {
        return UIColor(red: 211.0 / 255.0, green: 56.0 / 255.0, blue: 28.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var pinkishGreyTwo: UIColor {
        return UIColor(red: 190.0 / 255.0, green: 187.0 / 255.0, blue: 187.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var sienna: UIColor {
        return UIColor(red: 211.0 / 255.0, green: 56.0 / 255.0, blue: 29.0 / 255.0, alpha: 1.0)
    }
    
}

extension UIColor {
    convenience init(hex: String) {
        // スペースや改行がはいっていたらトリムする
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // 頭に#がついていたら取り除く
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        // RGBに変換する
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
