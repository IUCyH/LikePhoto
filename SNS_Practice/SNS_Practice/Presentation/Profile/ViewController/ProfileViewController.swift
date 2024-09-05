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
    
    private let cellReuseIdentifier: String = PhotoCollectionViewCell.identifier
    private lazy var collectionViewCellSize: CGFloat = calculateCellSize(itemCountPerRow: 3, spacingPerCell: 0)
    private let rootStackView: UIStackView = UIStackView()
    private let infoStackView: UIStackView = UIStackView()
    private let name: UILabel = UILabel()
    private let profileImage: UIImageView = UIImageView()
    private let photos: UICollectionView = {
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
            $0.spacing = 30
        }
        
        infoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 25
        }
        
        name.do {
            $0.text = "Lucy"
            $0.font = .systemFont(ofSize: 35, weight: .bold)
        }
        
        profileImage.do {
            $0.image = UIImage(systemName: "person.circle.fill")
            $0.makeRoundedCorner(radius: 8.5)
            $0.contentMode = .scaleAspectFit
        }
        
        photos.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        }
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        infoStackView.addArrangedSubviews(profileImage, name)
        rootStackView.addArrangedSubviews(infoStackView, photos)
        view.addSubViews(rootStackView)
        
        enableAutoLayouts(rootStackView, infoStackView, profileImage, name, photos)
        
        rootStackView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.centerY.equalTo(safeArea)
            $0.top.equalTo(safeArea)
            $0.bottom.equalTo(safeArea)
        }
        
        infoStackView.snp.makeConstraints {
            $0.width.equalTo(safeArea)
            $0.top.equalTo(rootStackView)
            $0.bottom.equalTo(photos.snp_topMargin)
        }
        
        profileImage.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        photos.snp.makeConstraints {
            $0.width.equalTo(safeArea)
        }
    }
    
    private func calculateCellSize(itemCountPerRow: CGFloat, spacingPerCell: CGFloat) -> CGFloat {
        let width: CGFloat = photos.bounds.width
        let numberOfItemsPerRow: CGFloat = itemCountPerRow
        let spacing: CGFloat = spacingPerCell
        let availableWidth: CGFloat = width - spacing * (numberOfItemsPerRow + 1)
       
        let size: CGFloat = floor(availableWidth / numberOfItemsPerRow)
        return size
    }
}

// MARK: UICollectionView
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewCellSize, height: collectionViewCellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        
        return cell
    }
}
