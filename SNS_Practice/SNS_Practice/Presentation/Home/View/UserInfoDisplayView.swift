//
//  UserInfoDisplayView.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/15/24.
// 

import UIKit
import Then
import SnapKit

final class UserInfoDisplayView: BaseView {
    
    private let rootStackView: UIStackView = UIStackView()
    private let profileImageView: UIImageView = UIImageView()
    private let nameLabel: UILabel = UILabel()
    private var user: User? = nil
    
    init(user: User?) {
        self.user = user
        
        super.init()
    }

    override func setStyle() {
        rootStackView.do {
            $0.axis = .horizontal
            $0.alignment = .leading
            $0.spacing = 5
        }
        
        profileImageView.do {
            $0.image = UIImage(systemName: "person.circle.fill")
            $0.contentMode = .scaleAspectFit
        }
        
        nameLabel.do {
            $0.text = user?.name ?? "User"
            $0.font = .boldSystemFont(ofSize: 20)
            $0.textAlignment = .left
        }
    }
    
    override func setLayout() {
        rootStackView.addArrangedSubviews(profileImageView, nameLabel)
        addSubViews(rootStackView)
        
        enableAutoLayouts(rootStackView, profileImageView, nameLabel)
        
        rootStackView.snp.makeConstraints {
            $0.leading.equalTo(self)
            $0.trailing.equalTo(self)
            $0.top.equalTo(self)
            $0.bottom.equalTo(self)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(rootStackView)
        }
    }
    
    func setUser(user: User) {
        self.user = user
        
        setStyle()
        setLayout()
    }
}
