//
//  SignupCell.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 19/02/21.
//

import UIKit

class SignupUserDataCell: UICollectionViewCell {
    
    // MARK: - Properties
    weak var delegate: SignupDelegate?
    private var currentPage = 0
    static let reuseID = String(describing: SignupUserDataCell.self)
    
    private let cellTitle = Utilities.label(title: "1. Dados",
                                            font: UIFont(fontStyle: .archivoSemiBold, size: 20)!,
                                            color: UIColor.Palette.darkGray)
    
    private let tfName = Utilities.textField(placeholder: "Nome")
    lazy var nameContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "profile-icon"), textfield: self.tfName)
    
    private let tfEmail = Utilities.textField(placeholder: "E-mail")
    lazy var emailContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "email-icon"), textfield: self.tfEmail)
    
    lazy var btNext: UIButton = {
        let button = Utilities.button(title: "Proximo")
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension SignupUserDataCell {
    func setup(delegate: SignupDelegate) {
        self.delegate = delegate
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.setupUserData()
    }
    
    private func setupUserData() {
        self.addSubviews(self.cellTitle, self.nameContainer, self.emailContainer, self.btNext)
        
        self.cellTitle.anchor(top: self.topAnchor, left: self.leftAnchor, paddingLeft: 32)
        
        self.nameContainer.anchor(top: self.cellTitle.bottomAnchor, left: self.leftAnchor,
                                  right: self.rightAnchor, paddingTop: 24,
                                  paddingLeft: 24, paddingRight: 24)
        
        self.emailContainer.anchor(top: self.nameContainer.bottomAnchor, left: self.leftAnchor,
                                   right: self.rightAnchor, paddingTop: 24,
                                   paddingLeft: 24, paddingRight: 24)
        
        self.btNext.anchor(top: self.emailContainer.bottomAnchor, left: self.leftAnchor,
                           right: self.rightAnchor, paddingTop: 32,
                           paddingLeft: 24, paddingRight: 24)
    }
}

// MARK: - Selectors
extension SignupUserDataCell {    
    @objc private func handleNext() {
        self.delegate?.goToNext()
    }
}
