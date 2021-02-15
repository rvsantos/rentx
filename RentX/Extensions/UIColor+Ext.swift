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
}
