//
//  AppCoordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

protocol AppFlowDelegate: class {
    func showWelcome()
    func showOnboarding()
}

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
        self.showWelcomeScreen()
//        self.showOnboardingScreen()
    }
}

// MARK: - Methods
extension AppCoordinator {
    private func showWelcomeScreen() {
        self.rootViewController = UINavigationController()
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
        
        let welcomeCoordinator = WelcomeCoordinator(navigationController: self.rootViewController
                                                        as! UINavigationController)
        welcomeCoordinator.coordinator = self
        coordinate(to: welcomeCoordinator)
    }
    
    private func showOnboardingScreen() {
        let onboarding = OnboardingController()
        onboarding.coordinator = self
        self.window.rootViewController = onboarding
        self.window.makeKeyAndVisible()
    }
}

// MARK: - AppFlowDelegate
extension AppCoordinator: AppFlowDelegate {
    func showWelcome() {
        self.showWelcomeScreen()
    }
    
    func showOnboarding() {
        self.showOnboardingScreen()
    }
}
