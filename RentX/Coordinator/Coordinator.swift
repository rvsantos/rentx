//
//  Coordinator.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import Foundation

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
