//
//  PhotoCollectionViewCell.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit
import Then
import SnapKit

final class PhotoCollectionViewCell: UICollectionViewCell, IdentifiableCell {
    
    static let identifier: String = "PhotoCell"
    private let postImageView: UIImageView = UIImageView()
    private let postImage: UIImage = UIImage(systemName: "person.circle.fill")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.borderWidth = 1
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        postImageView.do {
            $0.image = postImage
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .systemBlue
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(postImageView)
        
        enableAutoLayouts(postImageView)
        
        postImageView.snp.makeConstraints {
            $0.centerX.equalTo(contentView.safeAreaLayoutGuide)
            $0.centerY.equalTo(contentView.safeAreaLayoutGuide)
            $0.width.equalTo(contentView)
            $0.height.equalTo(contentView)
        }
    }
}
