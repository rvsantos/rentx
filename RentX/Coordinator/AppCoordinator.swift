//
//  AppCoordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

class AppCoordinator {
    
    // MARK: - Properties
    private let window: UIWindow
    private var rootViewController: UIViewController?
    
    // MARK: Constructor
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Coordinator Protocol
extension AppCoordinator: Coordinator {
    func start() {
        self.showLoginScreen()
    }
}

// MARK: - Methods
extension AppCoordinator {
    private func showLoginScreen() {
        self.rootViewController = UINavigationController()
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
        
        let loginCoordinator = LoginCoordinator(navigationController: self.rootViewController as! UINavigationController)
        coordinate(to: loginCoordinator)
    }
}
