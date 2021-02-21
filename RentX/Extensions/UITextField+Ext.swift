//
//  UITextField+Ext.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

extension UITextField {
    
    static func textField(placeholder: String, isSecure: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.autocapitalizationType    = .none
        textField.autocorrectionType        = .no
        textField.font                      = UIFont(fontStyle: .interRegular, size: 15)
        textField.textColor                 = UIColor.Palette.mediumGray
        textField.clearButtonMode           = .whileEditing
        textField.isSecureTextEntry         = isSecure
        textField.attributedPlaceholder     = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.Palette.gray])
        return textField
    }
    
    static func validateAll(textFields: [UITextField]) -> Bool {
        for field in textFields {
            guard let fieldText = field.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                return false
            }
            
            if (fieldText.isEmpty) {
                return false
            }
        }
        return true
    }
}
