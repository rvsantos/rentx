//
//  SignupVM.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 20/02/21.
//

import Foundation

struct SignupVM {
    var name: String?
    var email: String?
    var password: String?
    var repeatPassword: String?
    
    func checkIfEmailIsEqual(_ lhside: String, _ rhside: String) -> Bool {
        return lhside == rhside
    }
}
