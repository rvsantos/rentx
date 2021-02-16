//
//  UITextField+Ext.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

extension UITextField {
    
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
