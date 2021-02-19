//
//  OnboardingCell.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 19/02/21.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseID = String(describing: OnboardingCell.self)
    
    private let labelTitle = Utilities.label(title: "Titulo",
                                             font: UIFont(fontStyle: .archivoSemiBold, size: 40)!,
                                             color: UIColor.Palette.darkGray)
    
    private let labelDescription = Utilities.label(title: "Description",
                                                   font: UIFont(fontStyle: .interRegular, size: 15)!,
                                                   color: UIColor.Palette.mediumGray)
    
    private let icon: UIImageView = {
        let image = UIImageView()
        image.setDimensions(height: 66, width: 66)
        return image
    }()
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension OnboardingCell {
    func setup(_ content: Onboarding) {
        self.labelTitle.text        = content.title
        self.labelDescription.text  = content.description
        self.icon.image             = UIImage(named: content.icon)
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        
        self.addSubviews(self.icon, self.labelTitle, self.labelDescription)
        self.icon.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 167, paddingLeft: 39)
        self.labelTitle.anchor(top: self.icon.bottomAnchor, left: self.leftAnchor, paddingTop: 96,
                               paddingLeft: 32, width: 183)
        self.labelDescription.anchor(top: self.labelTitle.bottomAnchor, left: self.leftAnchor,
                                     paddingTop: 24, paddingLeft: 32, width: 199)
    }
}
