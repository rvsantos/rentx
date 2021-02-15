//
//  UITableView+Ext.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 09/02/21.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCell() {
        tableFooterView = UIView(frame: .zero)
    }
}
