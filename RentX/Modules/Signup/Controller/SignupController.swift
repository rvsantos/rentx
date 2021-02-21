//
//  SignupController.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 19/02/21.
//

import UIKit

protocol SignupDelegate: class {
    func goToNext()
}

class SignupController: UIViewController {
    
    // MARK: - Properties
    var coordinator: SignupFlow?
    private let signupVM = SignupVM()
    
    private let signupTitle: UILabel = {
        let label = Utilities.label(title: "signupTitle".localizable,
                                    font: UIFont(fontStyle: .archivoSemiBold, size: 40)!,
                                    color: UIColor.Palette.darkGray)
        return label
    }()
    
    private let signupDescription: UILabel = {
        let label = Utilities.label(title: "signupDescription".localizable,
                                    font: UIFont(fontStyle: .interRegular, size: 15)!,
                                    color: UIColor.Palette.mediumGray)
        return label
    }()
    
    lazy var btBack: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.Palette.mediumGray
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(handleBackNavigation), for: .touchUpInside)
        return button
    }()
    
    private let cellTitle = Utilities.label(title: "1. Dados",
                                            font: UIFont(fontStyle: .archivoSemiBold, size: 20)!,
                                            color: UIColor.Palette.darkGray)
    
    private let tfName = Utilities.textField(placeholder: "Nome")
    lazy var nameContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "profile-icon"), textfield: self.tfName)
    
    private let tfEmail = Utilities.textField(placeholder: "E-mail")
    lazy var emailContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "email-icon"), textfield: self.tfEmail)
    
    private let tfSenha = Utilities.textField(placeholder: "Senha", isSecure: true)
    lazy var passwordContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "password-icon"), textfield: self.tfSenha)
    
    private let tfRepeatSenha = Utilities.textField(placeholder: "Repetir senha", isSecure: true)
    lazy var repeatPasswordContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "password-icon"),
                                                                textfield: self.tfRepeatSenha)
    
    private let viewSpace: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        return view
    }()
    
    lazy var btSignup: UIButton = {
        let button = Utilities.button(title: "Cadastrar")
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: - Methods
extension SignupController {
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubviews(self.btBack, self.signupTitle, self.signupDescription)
        
        self.btBack.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,
                           paddingTop: 68, paddingLeft: 30)
        
        self.signupTitle.anchor(top: self.btBack.bottomAnchor, left: self.view.leftAnchor,
                                paddingTop: 80, paddingLeft: 30, width: 155)
        
        self.signupDescription.anchor(top: self.signupTitle.bottomAnchor, left: self.view.leftAnchor,
                                      paddingTop: 24, paddingLeft: 30, width: 155)
        
        self.setupStackView()
    }
    
    private func setupStackView() {
        let stack = UIStackView(arrangedSubviews: [self.nameContainer, self.emailContainer,
                                                   self.passwordContainer, self.repeatPasswordContainer,
                                                   self.viewSpace, self.btSignup])
        stack.axis = .vertical
        stack.spacing = 8
        
        self.view.addSubview(stack)
        stack.anchor(top: self.signupDescription.bottomAnchor, left: self.view.leftAnchor,
                     right: self.view.rightAnchor, paddingTop: 110, paddingLeft: 24,
                     paddingRight: 24)
    }
}

// MARK: Selectors
extension SignupController {
    @objc private func handleBackNavigation() {
        self.coordinator?.coordinateToWelcome()
    }
    
    @objc private func handleSignup() {
        
    }
}

// MARK: - Selectors

extension SignupController: CollectionCellTextFieldDelegate {
    func cellTextFields(_ fields: [UITextField]) {
        fields.forEach {
            print($0.text ?? "Empty Field")
        }
    }
}
