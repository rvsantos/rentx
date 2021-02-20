//
//  OnboardingVM.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 20/02/21.
//

import UIKit

struct OnboardingVM {
    
    // MARK: - Properties
    private let pages: [Onboarding] = [
        .init(title: "Primeiro, escolha a data",
              description: "Você e quem define um período, e nós mostraremos os carros disponiveis.",
              icon: "appointment-icon"),
        .init(title: "Depois, escolha o carro",
              description: "Vários modelos para você dirigir seguro, com conforto e segurança.",
              icon: "car-icon")]
    
    var numberOfRows: Int {
        return self.pages.count
    }
    
    // MARK: - Constructor
//    init(pages: [Onboarding]) {
//        self.pages = pages
//    }
}

// MARK: - Methods
extension OnboardingVM {
    func onboardingAt(_ index: Int) -> Onboarding {
        return self.pages[index]
    }
}
