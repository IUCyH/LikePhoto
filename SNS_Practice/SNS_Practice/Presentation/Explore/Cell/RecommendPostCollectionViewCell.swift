//
//  RecommendPostCollectionViewCell.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/7/24.
// 

import UIKit
import Then
import SnapKit

final class RecommendPostCollectionViewCell: UICollectionViewCell, IdentifiableCell {
    
    static let identifier: String = "RecommendPostCell"
    private let photo: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.gray.cgColor
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        photo.do {
            $0.image = UIImage(systemName: "books.vertical.fill")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(photo)
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        photo.snp.makeConstraints {
            $0.centerX.equalTo(contentView)
            $0.centerY.equalTo(contentView)
            $0.width.equalTo(contentView)
            $0.height.equalTo(contentView)
        }
    }
}
