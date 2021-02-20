//
//  OnboardingVM.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 20/02/21.
//

import UIKit

struct OnboardingVM {
    
    // MARK: - Properties
    private let pages: [Onboarding]
    
    var numberOfRows: Int {
        return self.pages.count
    }
    
    // MARK: - Constructor
    init(pages: [Onboarding]) {
        self.pages = pages
    }
}

// MARK: - Methods
extension OnboardingVM {
    func onboardingAt(_ index: Int) -> Onboarding {
        return self.pages[index]
    }
}
