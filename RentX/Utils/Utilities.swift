//
//  Utilities.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

final class Utilities {
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
}
