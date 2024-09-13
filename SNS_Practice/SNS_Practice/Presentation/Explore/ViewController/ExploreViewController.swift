//
//  ExploreViewController.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/7/24.
//

import UIKit

final class ExploreViewController: BaseViewController {
    
    // MARK: Component
    private let rootStackView: UIStackView = UIStackView()
    private let searchField: UITextField = UITextField()
    private let recommendPosts: BaseCollectionView<RecommendPostCollectionViewCell> = {
        let layout = UICollectionViewFlowLayout()
        let view = BaseCollectionView<RecommendPostCollectionViewCell>(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        rootStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 10
        }
        
        searchField.do {
            $0.borderStyle = .roundedRect
            $0.placeholder = "Search"
            $0.autocapitalizationType = .none
            $0.clearButtonMode = .whileEditing
        }
   
        recommendPosts.do {
            $0.cellIdentifier = RecommendPostCollectionViewCell.identifier
            $0.cellSizeCalculateSource = (3, 0)
            $0.numberOfItemsInSection = 100
            $0.sectionCount = 1
        }
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        rootStackView.addArrangedSubviews(searchField, recommendPosts)
        view.addSubViews(rootStackView)
        
        enableAutoLayouts(rootStackView, searchField, recommendPosts)
        
        rootStackView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.centerY.equalTo(safeArea)
            $0.top.equalTo(safeArea)
            $0.bottom.equalTo(safeArea)
        }
        
        searchField.snp.makeConstraints {
            $0.width.equalTo(safeArea).offset(-50)
        }
        
        recommendPosts.snp.makeConstraints {
            $0.width.equalTo(safeArea)
        }
    }
}
