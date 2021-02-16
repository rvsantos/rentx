//
//  LoginController.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    private let labelTitle: UILabel = Utilities.label(
        title: "loginTitle".localizable,
        font: UIFont(fontStyle: .archivoSemiBold, size: 40)!,
        color: UIColor.Palette.darkGray)
    
    private let labelDescription: UILabel = Utilities.label(
        title: "loginDescription".localizable,
        font: UIFont(fontStyle: .interRegular, size: 15)!,
        color: UIColor.Palette.mediumGray)
    
    private let btForgotPassword: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(fontStyle: .interRegular, size: 13)
        button.setTitle("forgotPassword".localizable, for: .normal)
        button.setTitleColor(UIColor.Palette.mediumGray, for: .normal)
        return button
    }()
    
    private let lbCheckbox: UILabel = Utilities.label(
        title: "rememberMe".localizable,
        font: UIFont(fontStyle: .interRegular, size: 13)!,
        color: UIColor.Palette.mediumGray)
    
    private let tfEmail: UITextField = Utilities.textField(placeholder: "E-mail")
    private let tfPassword: UITextField = Utilities.textField(placeholder: "Senha", isSecure: true)
    private let btLogin: UIButton = Utilities.button(title: "Login")
    private let cbRememberMe: Checkbox = Checkbox()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: Methods
extension LoginController {
    private func setupUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupLabels()
        self.setupTextField()
        self.setupButton()
    }
    
    private func setupLabels() {
        self.view.addSubViews(self.labelTitle, self.labelDescription)
        
        self.labelTitle.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,
                               paddingTop: 160, paddingLeft: 32, width: 169)
        self.labelDescription.anchor(top: self.labelTitle.bottomAnchor, left: self.view.leftAnchor,
                                     paddingTop: 24, paddingLeft: 32, width: 204)
    }
    
    private func setupTextField() {
        let containerEmail = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "email-icon"), textfield: self.tfEmail)
        let containerPassword = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "password-icon"), textfield: self.tfPassword)

        let stack           = UIStackView(arrangedSubviews: [containerEmail, containerPassword])
        stack.axis          = .vertical
        stack.distribution  = .fillEqually
        stack.spacing       = 8

        self.view.addSubViews(stack)
        stack.anchor(top: self.labelDescription.bottomAnchor,left: self.view.leftAnchor,
                     right: self.view.rightAnchor, paddingTop: 110, paddingLeft: 24, paddingRight: 24)
        stack.centerX(inView: self.view)
        
        self.setupCheckbox(stack: stack)
    }
    
    private func setupButton() {
        self.view.addSubview(self.btLogin)
        self.btLogin.anchor(top: self.btForgotPassword.bottomAnchor, left: self.view.leftAnchor,
                            right: self.view.rightAnchor, paddingTop: 34,  paddingLeft: 24,
                            paddingRight: 24)
    }
    
    private func setupCheckbox(stack: UIStackView) {
        self.view.addSubViews(self.cbRememberMe, self.lbCheckbox, self.btForgotPassword)
        self.cbRememberMe.anchor(top: stack.bottomAnchor, left: self.view.leftAnchor,
                                 paddingTop: 34, paddingLeft: 24)
        
        self.lbCheckbox.anchor(left: self.cbRememberMe.rightAnchor, paddingLeft: 12)
        self.lbCheckbox.centerY(inView: self.cbRememberMe)
        
        self.btForgotPassword.anchor(right: self.view.rightAnchor, paddingRight: 24)
        self.btForgotPassword.centerY(inView: self.cbRememberMe)
        
        let tapCheckbox = UITapGestureRecognizer(target: self, action: #selector(handleToogleCheckbox))
        self.cbRememberMe.addGestureRecognizer(tapCheckbox)
    }
}

// MARK: Selectors
extension LoginController {
    @objc private func handleToogleCheckbox() {
        self.cbRememberMe.toogle()
    }
}
