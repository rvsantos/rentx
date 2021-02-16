//
//  Checkbox.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 15/02/21.
//

import UIKit

class Checkbox: UIView {
    
    // MARK: - Properties
    var isChecked = false
    
    private let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Palette.lightGray
        view.setDimensions(height: 8, width: 8)
        view.isHidden = true
        return view
    }()
    
    lazy var fillView: UIView = {
        let view = UIView()
        view.setDimensions(height: 20, width: 20)
        view.backgroundColor = .black
        view.isHidden = true
        view.addSubview(self.centerView)
        self.centerView.center(inView: view)
        return view
    }()
    
    // MARK: - Constructors
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

// MARK: - Private Methods
extension Checkbox {
    private func setup() {
        self.backgroundColor = UIColor.Palette.lightGray
        self.setDimensions(height: 20, width: 20)
        self.addSubview(self.fillView)
    }
    
    public func toogle() {
        self.isChecked = !self.isChecked
        self.fillView.isHidden = !self.isChecked
        self.centerView.isHidden = !self.isChecked
    }
}
