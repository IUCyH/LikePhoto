//
//  ViewController.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
//

import UIKit
import SnapKit
import Then

final class ProfileViewController: BaseViewController {
    
    private let rootStackView: UIStackView = UIStackView()
    private let infoStackView: UIStackView = UIStackView()
    private let userMetaStackView: UIStackView = UIStackView()
    private let followInfoStackView: UIStackView = UIStackView()
    
    private let name: UILabel = UILabel()
    private let numOfFollower: UILabel = UILabel()
    private let numOfFollowing: UILabel = UILabel()
    private let profileImageView: UIImageView = UIImageView()
    
    private let photos: BaseCollectionView<PhotoCollectionViewCell> = {
        let layout = UICollectionViewFlowLayout()
        let view = BaseCollectionView<PhotoCollectionViewCell>(frame: .zero, collectionViewLayout: layout)
        
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
            $0.spacing = 30
        }
        
        infoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
            $0.alignment = .center
        }
        
        userMetaStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 5
        }
        
        followInfoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
        }
        
        name.do {
            $0.text = "Lucy"
            $0.font = .systemFont(ofSize: 40, weight: .bold)
        }
        
        numOfFollower.do {
            $0.text = "100\nfollowers"
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textAlignment = .center
        }
        
        numOfFollowing.do {
            $0.text = "100\nfollowing"
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textAlignment = .center
        }
        
        profileImageView.do {
            $0.image = UIImage(systemName: "person.circle.fill")
            $0.makeRoundedCorner(radius: 8.5)
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .systemBlue
        }
        
        photos.do {
            $0.cellIdentifier = PhotoCollectionViewCell.identifier
            $0.cellSizeCalculateSource = (3, 0)
            $0.numberOfItemsInSection = 15
            $0.sectionCount = 1
        }
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        followInfoStackView.addArrangedSubviews(numOfFollower, numOfFollowing)
        userMetaStackView.addArrangedSubviews(name, followInfoStackView)
        infoStackView.addArrangedSubviews(profileImageView, userMetaStackView)
        rootStackView.addArrangedSubviews(infoStackView, photos)
        view.addSubViews(rootStackView)
        
        enableAutoLayouts(rootStackView, infoStackView, userMetaStackView, followInfoStackView, profileImageView, name, numOfFollower, numOfFollowing, photos)
        
        rootStackView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.centerY.equalTo(safeArea)
            $0.top.equalTo(safeArea)
            $0.bottom.equalTo(safeArea)
        }
        
        infoStackView.snp.makeConstraints {
            $0.width.equalTo(safeArea)
            $0.top.equalTo(rootStackView)
            $0.bottom.equalTo(photos.snp.top)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.equalTo(150)
            $0.height.equalTo(150)
        }
        
        photos.snp.makeConstraints {
            $0.width.equalTo(safeArea)
        }
    }
}
