//
//  LoginCoordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

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
        self.navigationController.setViewControllers([loginController], animated: true)
    }
}
