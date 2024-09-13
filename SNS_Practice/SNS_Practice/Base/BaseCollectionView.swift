//
//  BaseCollectionViewController.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/14/24.
// 

import UIKit

final class BaseCollectionView<Cell: UICollectionViewCell>: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cellIdentifier: String? {
        didSet {
            if let cellIdentifier {
                register(Cell.self, forCellWithReuseIdentifier: cellIdentifier)
            }
        }
    }
    var cellSizeCalculateSource: (itemCountPerRow: CGFloat, spacingPerCell: CGFloat) = (0, 0)
    var sectionCount: Int = 0
    var numberOfItemsInSection: Int = 0
    private lazy var cellSize: CGFloat = calculateCellSize(itemCountPerRow: cellSizeCalculateSource.itemCountPerRow, spacingPerCell: cellSizeCalculateSource.spacingPerCell)
    
    /// Use this with UICollectionViewFlowLayout
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellIdentifier else {
            let cell = UICollectionViewCell()
            let textView: UITextView = UITextView()
            
            textView.text = "Can't get a cellIdentifier!"
            cell.contentView.addSubview(textView)
            
            textView.snp.makeConstraints {
                $0.top.equalTo(cell.contentView)
                $0.bottom.equalTo(cell.contentView)
                $0.leading.equalTo(cell.contentView)
                $0.trailing.equalTo(cell.contentView)
            }
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    private func calculateCellSize(itemCountPerRow: CGFloat, spacingPerCell: CGFloat) -> CGFloat {
        let width: CGFloat = bounds.size.width
        let numberOfItemsPerRow: CGFloat = itemCountPerRow
        let spacing: CGFloat = spacingPerCell
        let availableWidth: CGFloat = width - spacing * (numberOfItemsPerRow + 1)
        
        let size: CGFloat = floor(availableWidth / numberOfItemsPerRow)
        return size
    }
}
