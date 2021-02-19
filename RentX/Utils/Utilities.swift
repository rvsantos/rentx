//
//  Utilities.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

final class Utilities {
    static func label(title: String, font: UIFont, color: UIColor) -> UILabel {
        let label               = UILabel()
        label.text              = title
        label.textColor         = color
        label.font              = font
        label.lineBreakMode     = .byWordWrapping
        label.numberOfLines     = 0
        return label
    }
    
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
    
    static func inputContainerView(withImage image: UIImage, textfield: UITextField) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.Palette.lightGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        let imageView = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageView.image = image.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.Palette.mediumGray
        view.addSubview(imageView)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 15, width: 20, height: 20)
        imageView.centerY(inView: view)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .white
        view.addSubview(separatorView)
        separatorView.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, paddingLeft: 15,
                             width: 5, height: 50)
        
        view.addSubview(textfield)
        textfield.anchor(left: separatorView.rightAnchor, right: view.rightAnchor, paddingLeft: 8)
        textfield.centerY(inView: view)
        
        return view
    }
    
    static func button(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(fontStyle: .interMedium, size: 15)
        button.backgroundColor = UIColor.Palette.red
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return button
    }
}
