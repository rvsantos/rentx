//
//  SignupUserPasswordCell.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 20/02/21.
//

import UIKit

class SignupUserPasswordCell: UICollectionViewCell {
    
    // MARK: - Properties
    weak var delegate: SignupDelegate?
    static let reuseID = String(describing: SignupUserPasswordCell.self)
    
    private let cellTitle = Utilities.label(title: "2. Password",
                                            font: UIFont(fontStyle: .archivoSemiBold, size: 20)!,
                                            color: UIColor.Palette.darkGray)
    
    private let tfSenha = Utilities.textField(placeholder: "Senha", isSecure: true)
    lazy var passwordContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "password-icon"), textfield: self.tfSenha)
    
    private let tfRepeatEmail = Utilities.textField(placeholder: "Repetir senha", isSecure: true)
    lazy var repeatPasswordContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "email-icon"),
                                                                    textfield: self.tfRepeatEmail)

    lazy var btSignup: UIButton = {
        let button = Utilities.button(title: "Cadastrar")
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
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
extension SignupUserPasswordCell {
    func setup(delegate: SignupDelegate) {
        self.delegate = delegate
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.setupUserPassword()
    }
    
    private func setupUserPassword() {
        self.addSubviews(self.cellTitle, self.passwordContainer, self.repeatPasswordContainer, self.btSignup)
        self.cellTitle.text = "02. Senha"
        
        self.cellTitle.anchor(top: self.topAnchor, left: self.leftAnchor, paddingLeft: 32)
        
        self.passwordContainer.anchor(top: self.cellTitle.bottomAnchor, left: self.leftAnchor,
                                      right: self.rightAnchor, paddingTop: 24,
                                      paddingLeft: 24, paddingRight: 24)
        
        self.repeatPasswordContainer.anchor(top: self.passwordContainer.bottomAnchor, left: self.leftAnchor,
                                            right: self.rightAnchor, paddingTop: 24,
                                            paddingLeft: 24, paddingRight: 24)
        
        self.btSignup.anchor(top: self.repeatPasswordContainer.bottomAnchor, left: self.leftAnchor,
                             right: self.rightAnchor, paddingTop: 32,
                             paddingLeft: 24, paddingRight: 24)
    }
}

// MARK: - Selectors
extension SignupUserPasswordCell {
    @objc private func handleSignup() {
        print("DEBUG: Create user")
    }
}
