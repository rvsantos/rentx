//
//  WelcomeController.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 19/02/21.
//

import UIKit

class WelcomeController: UIViewController {
    
    // MARK: - Properties
    var coordinator: WelcomeFlowDelegate?
    
    private let labelTitle: UILabel = {
        let label: UILabel = .label(title: "Seja  Bem-vindo",
                                    font: UIFont(fontStyle: .archivoSemiBold, size: 40)!,
                                    color: .white)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.setDimensions(height: 88, width: 202)
        return label
    }()
    
    private let labelDescription: UILabel = .label(title: "O que você deseja fazer?",
                                                   font: UIFont(fontStyle: .interRegular, size: 15)!,
                                                   color: .white)
    
    private let icon: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "logo"))
        image.setDimensions(height: 49, width: 80)
        return image
    }()
    
    lazy var btLogin: UIButton = {
        let button: UIButton  = .button(title: "Login")
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var btSignUp: UIButton = {
        let button: UIButton = .button(title: "Cadastro")
        button.backgroundColor = UIColor.Palette.black
        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        return button
    }()
    
    lazy var btBack: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(UIColor.Palette.mediumGray, for: .normal)
        button.titleLabel?.font = UIFont(fontStyle: .archivoSemiBold, size: 13)
        button.addTarget(self, action: #selector(goToOnboarding), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Constructor
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: - Methods
extension WelcomeController {
    private func setupUI() {
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubviews(self.icon, self.labelTitle, self.labelDescription,
                         self.btLogin, self.btSignUp, self.btBack)
        
        self.icon.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, paddingTop: 130)
        self.icon.centerX(inView: self.view)
        
        self.labelTitle.anchor(top: self.icon.bottomAnchor, paddingTop: 120)
        self.labelTitle.centerX(inView: self.view)
        
        self.labelDescription.anchor(top: self.labelTitle.bottomAnchor, paddingTop: 16, width: 180)
        self.labelDescription.centerX(inView: self.view)
        
        self.btLogin.anchor(top: self.labelDescription.bottomAnchor, left: self.view.leftAnchor,
                            paddingTop: 177, paddingLeft: 24, width: 156)
        
        self.btSignUp.anchor(top: self.labelDescription.bottomAnchor, right: self.view.rightAnchor,
                            paddingTop: 177, paddingRight: 24, width: 156)
        
        self.btBack.anchor(top: self.btLogin.bottomAnchor, paddingTop: 43)
        self.btBack.centerX(inView: self.view)
    }
}

// MARK: - Selectors
extension WelcomeController {
    @objc private func goToLogin() {
        self.coordinator?.showLogin()
    }
    
    @objc private func goToSignUp() {
        self.coordinator?.showSignup()
    }
    
    @objc private func goToOnboarding() {
        self.coordinator?.backOnboarding()
    }
}
