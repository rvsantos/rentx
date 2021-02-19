//
//  WelcomeCoordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 19/02/21.
//

import UIKit

protocol WelcomeFlowDelegate: class {
    func showLogin()
    func showSignup()
    func backOnboarding()
}

class WelcomeCoordinator {
    
    // MARK: - Properties
    weak var coordinator: AppFlowDelegate?
    private let navigationController: UINavigationController
    
    // MARK: - Constructor
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Coordinator
extension WelcomeCoordinator: Coordinator {
    func start() {
        let welcome = WelcomeController()
        welcome.coordinator = self
        self.navigationController.setViewControllers([welcome], animated: true)
    }
}

// MARK: - WelcomeFlowDelegate
extension WelcomeCoordinator: WelcomeFlowDelegate {
    func showLogin() {
        print("DEBUG: Show login")
    }
    
    func showSignup() {
        print("DEBUG: Show signup")
    }
    
    func backOnboarding() {
        self.coordinator?.showOnboarding()
    }
}
