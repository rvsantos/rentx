//
//  RegistrationCoordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 16/02/21.
//

import UIKit

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
        self.navigationController.setViewControllers([signupController], animated: true)
    }
}
