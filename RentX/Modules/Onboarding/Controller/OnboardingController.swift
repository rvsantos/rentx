//
//  Onboarding.swift
//  RentX
//
//  Created by Rafael V. dos Santos on 18/02/21.
//

import UIKit

class OnboardingController: UIViewController {
    
    // MARK: - Properties
    private let content: [Onboarding] = [
        .init(title: "Primeiro, escolha a data",
              description: "Você e quem define um período, e nós mostraremos os carros disponiveis.",
              icon: "appointment-icon"),
        .init(title: "Depois, escolha o carro",
              description: "Vários modelos para você dirigir seguro, com conforto e segurança.",
              icon: "car-icon")]
    
    weak var coordinator: AppFlowDelegate?
    
    private let containerPageControl: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let pageControl: UIPageControl = {
        let page                            = UIPageControl()
        page.currentPage                    = 0
        page.numberOfPages                  = 2
        page.pageIndicatorTintColor         = UIColor.Palette.lightGray
        //        page.setDimensions(height: 8, width: 8)
        page.currentPageIndicatorTintColor  = .black
        return page
    }()
    
    lazy var btNext: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "arrow-forward"), for: .normal)
        button.setDimensions(height: 15, width: 10)
        button.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.estimatedItemSize = .zero

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
}

// MARK: - Lifecycle
extension OnboardingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

// MARK: - Methods
extension OnboardingController {
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.setupPageControlContainer()
        self.setupCollectionView()
    }
    
    private func setupPageControlContainer() {
        self.view.addSubview(self.containerPageControl)
        self.containerPageControl.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor,
                                         right: self.view.rightAnchor, height: 100)
        
        self.containerPageControl.addSubviews(self.pageControl, self.btNext)
        self.pageControl.anchor(top: self.containerPageControl.topAnchor,
                                left: self.containerPageControl.leftAnchor,
                                paddingTop: 32)
        
        self.btNext.anchor(right: self.containerPageControl.rightAnchor, paddingRight: 32)
        self.btNext.centerY(inView: self.pageControl)
    }
    
    private func setupCollectionView() {
        self.collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.reuseID)
       
        self.view.addSubview(self.containerView)
        self.containerView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,
                                  bottom: self.containerPageControl.topAnchor, right: self.view.rightAnchor)
        
        self.containerView.addSubview(self.collectionView)
        self.collectionView.anchor(top: self.containerView.topAnchor,
                                   left: self.containerView.leftAnchor,
                                   bottom: self.containerView.bottomAnchor,
                                   right: self.containerView.rightAnchor)
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
}

// MARK: - Selectors
extension OnboardingController {
    @objc private func goToNext() {
        let newRow = self.getCurrentIndex() + 1
        
        if newRow >= self.content.count {
            self.coordinator?.showWelcome()
        } else {
            let nextIndexPath = IndexPath(row: newRow, section: 0)
            self.collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
            self.pageControlSetCurrentPage(at: newRow)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension OnboardingController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension OnboardingController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.content.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseID,
                                                      for: indexPath) as? OnboardingCell
        cell?.setup(self.content[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.collectionView.frame.size
    }
}
