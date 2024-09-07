//
//  HomeViewController.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/5/24.
// 

import UIKit
import Then
import SnapKit

final class HomeViewController: BaseViewController {
    
    private let cellReuseIdentifier: String = RecentPostTableViewCell.identifier
    private let posts: UITableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        posts.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(RecentPostTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
            $0.separatorStyle = .none
        }
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubViews(posts)
        
        enableAutoLayouts(posts)
        
        posts.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.centerY.equalTo(safeArea)
            $0.width.equalTo(safeArea)
            $0.height.equalTo(safeArea)
        }
    }
}

// MARK: UITableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
       
        return cell
    }
}
