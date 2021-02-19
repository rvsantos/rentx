//
//  UIColor+Ext.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 09/02/21.
//

import UIKit

extension UIColor {
    public convenience init?(hexDecimal: String) {
        let red, green, blue, alpha: CGFloat
        
        if hexDecimal.hasPrefix("#") {
            let start = hexDecimal.index(hexDecimal.startIndex, offsetBy: 1)
            let hexColor = String(hexDecimal[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    alpha = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: red, green: green, blue: blue, alpha: alpha)
                    return
                }
            }
        }
        return nil
    }
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    struct Palette {
        static let darkGray     = UIColor.rgb(red: 61, green: 61, blue: 77)
        static let mediumGray   = UIColor.rgb(red: 122, green: 122, blue: 128)
        static let gray         = UIColor.rgb(red: 174, green: 174, blue: 179)
        static let lightGray    = UIColor.rgb(red: 242, green: 242, blue: 250)
        static let red          = UIColor.rgb(red: 220, green: 22, blue: 55)
        static let black        = UIColor.rgb(red: 41, green: 41, blue: 46)
    }
}
