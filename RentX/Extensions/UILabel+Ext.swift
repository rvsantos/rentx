//
//  UILabel+Ext.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 21/02/21.
//

import UIKit

extension UILabel {
    static func label(title: String, font: UIFont, color: UIColor) -> UILabel {
        let label               = UILabel()
        label.text              = title
        label.textColor         = color
        label.font              = font
        label.lineBreakMode     = .byWordWrapping
        label.numberOfLines     = 0
        return label
    }
}
