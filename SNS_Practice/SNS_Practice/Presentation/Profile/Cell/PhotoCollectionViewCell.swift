//
//  PhotoCollectionViewCell.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit
import Then
import SnapKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PhotoCell"
    private let imageView: UIImageView = UIImageView()
    
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
        imageView.do {
            $0.image = UIImage(systemName: "person.circle.fill")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func setLayout() {
        contentView.addSubViews(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.snp.makeConstraints {
            $0.centerX.equalTo(contentView.safeAreaLayoutGuide)
            $0.centerY.equalTo(contentView.safeAreaLayoutGuide)
            $0.width.equalTo(contentView)
            $0.height.equalTo(contentView)
        }
    }
}
