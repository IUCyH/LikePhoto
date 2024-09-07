//
//  ExploreViewController.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/7/24.
//

import UIKit

final class ExploreViewController: BaseViewController {
    
    private let cellReuseIdentifier: String = RecommendPostCollectionViewCell.identifier
    private lazy var cellSize: CGFloat = calculateCellSize(itemCountPerRow: 3, spacingPerCell: 0)
    private let rootStackView: UIStackView = UIStackView()
    private let searchField: UITextField = UITextField()
    private let recommendPosts: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
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
            $0.dataSource = self
            $0.delegate = self
            $0.register(RecommendPostCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
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
    
    private func calculateCellSize(itemCountPerRow: CGFloat, spacingPerCell: CGFloat) -> CGFloat {
        let width: CGFloat = recommendPosts.bounds.width
        let numberOfItemsPerRow: CGFloat = itemCountPerRow
        let spacing: CGFloat = spacingPerCell
        let availableWidth: CGFloat = width - spacing * (numberOfItemsPerRow + 1)
        
        let size: CGFloat = floor(availableWidth / numberOfItemsPerRow)
        return size
    }
}

// MARK: UICollectionView
extension ExploreViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        
        return cell
    }
}
