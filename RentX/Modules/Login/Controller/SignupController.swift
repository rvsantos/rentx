//
//  SignupController.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 19/02/21.
//

import UIKit

protocol SignupDelegate: class {
    func goToNext()
}

class SignupController: UIViewController {
    
    // MARK: - Properties
    var coordinator: SignupFlow?
    
    private let signupTitle: UILabel = {
        let label = Utilities.label(title: "signupTitle".localizable,
                                    font: UIFont(fontStyle: .archivoSemiBold, size: 40)!,
                                    color: UIColor.Palette.darkGray)
        return label
    }()
    
    private let signupDescription: UILabel = {
        let label = Utilities.label(title: "signupDescription".localizable,
                                    font: UIFont(fontStyle: .interRegular, size: 15)!,
                                    color: UIColor.Palette.mediumGray)
        return label
    }()
    
    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 2
        page.currentPage = 0
        page.currentPageIndicatorTintColor = UIColor.Palette.lightGray
        page.pageIndicatorTintColor = .black
        return page
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        
        return collection
    }()
    
    lazy var btBack: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.Palette.mediumGray
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(handleBackNavigation), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: - Methods
extension SignupController {
    private func setupUI() {
        self.collectionView.register(SignupUserDataCell.self,
                                     forCellWithReuseIdentifier: SignupUserDataCell.reuseID)
        self.collectionView.register(SignupUserPasswordCell.self,
                                     forCellWithReuseIdentifier: SignupUserPasswordCell.reuseID)
        self.view.backgroundColor = .white
        
        self.view.addSubviews(self.btBack, self.pageControl, self.collectionView,
                              self.signupTitle, self.signupDescription)
        
        self.btBack.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,
                           paddingTop: 68, paddingLeft: 30)
        
        self.pageControl.anchor(right: self.view.rightAnchor, paddingRight: 30)
        self.pageControl.centerY(inView: self.btBack)
        
        self.signupTitle.anchor(top: self.btBack.bottomAnchor, left: self.view.leftAnchor,
                                paddingTop: 80, paddingLeft: 30, width: 155)
        
        self.signupDescription.anchor(top: self.signupTitle.bottomAnchor, left: self.view.leftAnchor,
                                      paddingTop: 24, paddingLeft: 30, width: 155)
        
        self.collectionView.anchor(top: self.signupDescription.bottomAnchor, left: self.view.leftAnchor,
                                   right: self.view.rightAnchor, paddingTop: 116, height: 300)
    }
    
    private func getCurrentIndex() -> Int {
        return Int(self.collectionView.contentOffset.x / self.collectionView.frame.width)
    }
    
    private func pageControlSetCurrentPage(at index: Int) {
        self.pageControl.currentPage = index
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = self.getCurrentIndex()
        self.pageControlSetCurrentPage(at: index)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.panGestureRecognizer.isEnabled = false
    }
}

// MARK: - UICollectionViewDelegate
extension SignupController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension SignupController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignupUserDataCell.reuseID,
                                                          for: indexPath) as? SignupUserDataCell
            cell?.setup(delegate: self)
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignupUserPasswordCell.reuseID,
                                                          for: indexPath) as? SignupUserPasswordCell
            cell?.setup(delegate: self)
            return cell ?? UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SignupController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 300)
    }
}

// MARK: - SignupDelegate
extension SignupController: SignupDelegate {
    func goToNext() {
        let newRow = self.getCurrentIndex() + 1
        let nextIndexPath = IndexPath(row: newRow, section: 0)
        self.collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
        self.pageControlSetCurrentPage(at: newRow)
    }
}

// MARK: Selectors
extension SignupController {
    @objc private func handleBackNavigation() {
        self.coordinator?.coordinateToWelcome()
    }
}
