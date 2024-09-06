//
//  RecentPostTableViewCell.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/5/24.
// 

import UIKit
import Then
import SnapKit

final class RecentPostTableViewCell: UITableViewCell, IdentifiableCell {
    
    static let identifier: String = "RecentPostCell"
    private let rootStackView: UIStackView = UIStackView()
    private let postImageView: UIImageView = UIImageView()
    private let textContentView: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setStyle() {
        rootStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 10
        }
        
        postImageView.do {
            $0.image = UIImage(systemName: "lock.square.fill")
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .black
        }
        
        textContentView.do {
            $0.numberOfLines = 20
            $0.text = """
                    안녕! 이건 첫번째 줄이란다
                    이건.... 두번째?!
                    와 이건 세번째!
                    헐 네번째까지??
                    """
        }
    }
    
    private func setLayout() {
        rootStackView.addArrangedSubviews(postImageView, textContentView)
        contentView.addSubViews(rootStackView)
        
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        textContentView.translatesAutoresizingMaskIntoConstraints = false
        
        rootStackView.snp.makeConstraints {
            $0.width.equalTo(contentView)
            $0.height.equalTo(contentView)
            $0.centerX.equalTo(contentView)
            $0.centerY.equalTo(contentView)
        }
        
        postImageView.snp.makeConstraints {
            $0.width.equalTo(rootStackView)
            $0.height.equalTo(rootStackView).offset(-130)
        }
    }
}
