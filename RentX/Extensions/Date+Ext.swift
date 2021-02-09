//
//  Date.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 09/02/21.
//

import Foundation


extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
