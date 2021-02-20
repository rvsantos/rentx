//
//  LoginCoordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

protocol LoginFlow {
    func coordinateToWelcome()
}

class LoginCoordinator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: Constructor
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Coordinator Protocol
extension LoginCoordinator: Coordinator {
    func start() {
        let loginController = LoginController()
        loginController.coordinator = self
        self.navigationController.pushViewController(loginController, animated: true)
    }
}

// MARK: - LoginFlow
extension LoginCoordinator: LoginFlow {
    func coordinateToWelcome() {
        self.navigationController.popViewController(animated: true)
    }
}
