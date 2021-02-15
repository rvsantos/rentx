//
//  UIButton+Ext.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 09/02/21.
//

import UIKit

extension UIButton {
    func attributedTitle(firstPart: String, secondPart: String, size: CGFloat) {
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87),
                                                   .font: UIFont.systemFont(ofSize: size)]
        let attributedTitle = NSMutableAttributedString(string: "\(firstPart) ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87),
                                                       .font: UIFont.boldSystemFont(ofSize: size)]
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: boldAtts))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
