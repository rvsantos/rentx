//
//  Success.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 22/02/21.
//

import UIKit

class ConfirmationController: UIViewController {
    
    // MARK: - Properties
    
    var content: Confirmation? {
        didSet {
            if let content = content {
                self.lbTitle.text = content.title
                self.lbDescription.text = content.description
                self.btOk.setTitle(content.buttonTitle, for: .normal)
            }
        }
    }
    
    private var lbTitle: UILabel = .label(title: "Titulo",
                                          font: UIFont(fontStyle: .archivoSemiBold, size: 30)!,
                                          color: .white)
    
    private var lbDescription: UILabel = {
        let label: UILabel = .label(title: "Descrição",
                                    font: UIFont(fontStyle: .interRegular, size: 15)!,
                                    color: UIColor.Palette.mediumGray)
        label.textAlignment = .center
        return label
    }()
    
    private let viewHeader: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Palette.black
        return view
    }()
    
    private let imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "done")
        imageView.setDimensions(height: 80, width: 80)
        return imageView
    }()
    
    lazy var btOk: UIButton =  {
        let button = UIButton(type: .system)
        button.setDimensions(height: 56, width: 80)
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.Palette.black
        button.addTarget(self, action: #selector(okClick), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: - Methods
extension ConfirmationController {
    private func setupUI() {
        self.view.backgroundColor = .black
        
        self.view.addSubviews(self.viewHeader, self.imageIcon, self.lbTitle, self.lbDescription, self.btOk)
        
        self.viewHeader.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,
                               right: self.view.rightAnchor, paddingTop: 96, height: 235)
        
        self.imageIcon.anchor(top: self.viewHeader.bottomAnchor, paddingTop: 53)
        self.imageIcon.centerX(inView: self.view)
        
        self.lbTitle.anchor(top: self.imageIcon.bottomAnchor, paddingTop: 47)
        self.lbTitle.centerX(inView: self.view)
        
        self.lbDescription.anchor(top: self.lbTitle.bottomAnchor, paddingTop: 16, width: 166)
        self.lbDescription.centerX(inView: self.view)
        
        self.btOk.anchor(top: self.lbDescription.bottomAnchor, paddingTop: 80, width: 60, height: 68)
        self.btOk.centerX(inView: self.view)
    }
}

// MARK: - Selectors
extension ConfirmationController {
    @objc private func okClick() {
        print("DEBUG: Click ok.")
    }
}
