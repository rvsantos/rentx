//
//  UIFont+Ext.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

enum FontStyle: String {
    case interMedium        = "Inter-Medium"
    case interRegular       = "Inter-Regular"
    case archivoSemiBold    = "Archivo-SemiBold"
}

extension UIFont {
    convenience init?(fontStyle: FontStyle, size: CGFloat) {
        self.init(name: fontStyle.rawValue, size: size)
    }
}
