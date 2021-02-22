//
//  String.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 09/02/21.
//

import Foundation

extension String {
    var localizable: String { return NSLocalizedString(self, comment: "") }
    
    func convertToDate() -> Date? {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale        = Locale(identifier: "pt_BR")
        dateFormatter.timeZone      = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthYearFormat()
    }
    
    enum ValidityType {
        case email
        case password
    }
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{6,25}"
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
