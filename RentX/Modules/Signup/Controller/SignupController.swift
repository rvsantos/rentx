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
    var signupVM: SignupVM!
    
    private let validityTypeEmail: String.ValidityType = .email
    private let validityTypePassword: String.ValidityType = .password
    
    private let signupTitle: UILabel = .label(title: "signupTitle".localizable,
                                              font: UIFont(fontStyle: .archivoSemiBold, size: 40)!,
                                              color: UIColor.Palette.darkGray)
    
    private let signupDescription: UILabel = .label(title: "signupDescription".localizable,
                                                    font: UIFont(fontStyle: .interRegular, size: 15)!,
                                                    color: UIColor.Palette.mediumGray)
    
    lazy var btBack: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.Palette.mediumGray
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return button
    }()
    
    private let tfName: UITextField = .textField(placeholder: "Nome")
    lazy var nameContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "profile-icon"), textfield: self.tfName)
    
    lazy var tfEmail: UITextField =  .textField(placeholder: "E-mail")
    lazy var emailContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "email-icon"), textfield: self.tfEmail)
    
    private let tfPassword: UITextField = .textField(placeholder: "Senha", isSecure: true)
    lazy var passwordContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "password-icon"), textfield: self.tfPassword)
    
    private let tfRepeatPassword: UITextField = .textField(placeholder: "Repetir senha", isSecure: true)
    lazy var repeatPasswordContainer = Utilities.inputContainerView(withImage: #imageLiteral(resourceName: "password-icon"),
                                                                    textfield: self.tfRepeatPassword)
    
    private let viewSpace: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        return view
    }()
    
    lazy var btSignup: UIButton = {
        let button: UIButton = .button(title: "Cadastrar")
        button.addTarget(self, action: #selector(signupClick), for: .touchUpInside)
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
    
    private func checkIfEmailPasswordIsValid(_ email: String, _ password: String) -> Bool {
        var isValid = true
        
        if !email.isValid(self.validityTypeEmail) {
            self.showAlert(withTitle: "Email invalido",
                           message: "O email digitado é invalido")
            isValid = false
        } else if !password.isValid(self.validityTypePassword) {
            self.showAlert(withTitle: "Senha invalida",
                           message: "Senha invalida, tente outra senha.")
            isValid = false
        }
        
        return isValid
    }
}

// MARK: Selectors
extension SignupController {
    @objc private func backClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func signupClick() {
        if UITextField.validateAll(textFields: [self.tfName, self.tfEmail,
                                                self.tfPassword, self.tfRepeatPassword]) {
            guard let email = self.tfEmail.text else { return }
            guard let name = self.tfName.text else { return }
            guard let password = self.tfPassword.text else { return }
            guard let repeatPassword = self.tfRepeatPassword.text else { return }
            
            if self.checkIfEmailPasswordIsValid(email, password) {
                if self.signupVM.checkIfEmailIsEqual(password, repeatPassword) {
                    let user = User(name: name, email: email, password: password)
                    AuthService.registerUser(user: user) { [weak self] (error) in
                        if let error = error {
                            print("DEBUG: Error logging in \(error.localizedDescription)")
                            return
                        }
                        
                        let content = Confirmation(title: "Conta criada!",
                                                   description: "Agora é só fazer o login e aproveitar.",
                                                   buttonTitle: "Ok")
//                        self?.coordinator?.coordinateToSuccess(content)
                        let confirmationController = ConfirmationController()
                        confirmationController.content = content
                        self?.navigationController?.present(confirmationController,
                                                            animated: true,
                                                            completion: nil)
                    }
                    print("DEBUG: Cadastro realizado com sucesso! \(user)")
                } else {
                    self.showAlert(withTitle: "Senha invalido", message: "As senhas devem ser iguais.")
                }
            }
        } else {
            self.showAlert(withTitle: "Erro ao cadastrar", message: "Todos os campos devem ser preenchidos.")
        }
    }
}
