//
//  RegistrationCoordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 16/02/21.
//

import UIKit

protocol SignupFlow {
    func coordinateToWelcome()
}

class SignupCoordinator {
    
    // MARK: - Properties
    private let navigationController: UINavigationController
    
    // MARK: Constructor
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension SignupCoordinator: Coordinator {
    func start() {
        let signupController = SignupController()
        signupController.coordinator = self
        self.navigationController.pushViewController(signupController, animated: true)
    }
}

// MARK: - SignupFlow
extension SignupCoordinator: SignupFlow {
    func coordinateToWelcome() {
        self.navigationController.popViewController(animated: true)
    }
}
