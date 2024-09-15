//
//  CommentsDisplayButton.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/15/24.
// 

import UIKit
import Then
import SnapKit

final class CommentsDisplayButton: UIButton {
    
    private let buttonImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        buttonImageView.do {
            $0.image = UIImage(systemName: "bubble")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func setLayout() {
        addSubViews(buttonImageView)
        
        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonImageView.snp.makeConstraints {
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
            $0.top.equalTo(self)
            $0.bottom.equalTo(self)
        }
    }
}
