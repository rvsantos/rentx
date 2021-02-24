//
//  AuthService.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 22/02/21.
//

import Foundation
import Firebase

struct AuthService {
    static func logIn(withEmail email: String, password: String,
                      completion: ((AuthDataResult?, Error?) -> Void)?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(user: User, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let data: [String: Any] = [
                "name":     user.name,
                "email":    user.email
            ]
            
            Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
        }
    }
}
