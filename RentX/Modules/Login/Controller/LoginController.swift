//
//  LoginController.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    var coordinator: LoginFlow?
    
    private let labelTitle: UILabel = .label(
        title: "loginTitle".localizable,
        font: UIFont(fontStyle: .archivoSemiBold, size: 40)!,
        color: UIColor.Palette.darkGray)
    
    private let labelDescription: UILabel = .label(
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
    
    lazy var btBack: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.Palette.mediumGray
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return button
    }()
    
    private let lbCheckbox: UILabel = .label(
        title: "rememberMe".localizable,
        font: UIFont(fontStyle: .interRegular, size: 13)!,
        color: UIColor.Palette.mediumGray)
    
    private let tfEmail: UITextField = .textField(placeholder: "email".localizable)
    private let tfPassword: UITextField = .textField(
        placeholder: "password".localizable, isSecure: true)
    private let btLogin: UIButton = .button(title: "Login")
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
        self.view.addSubviews(self.btBack, self.labelTitle, self.labelDescription)
        
        self.btBack.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,
                           paddingTop: 67, paddingLeft: 32)
        
        self.labelTitle.anchor(top: self.btBack.topAnchor, left: self.view.leftAnchor,
                               paddingTop: 81, paddingLeft: 32, width: 169)
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
        
        self.view.addSubviews(stack)
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
        self.view.addSubviews(self.cbRememberMe, self.lbCheckbox, self.btForgotPassword)
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
    
    @objc private func backClick() {
        self.coordinator?.coordinateToWelcome()
    }
}
