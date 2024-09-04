//
//  ViewController.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit
import SnapKit
import Then

final class ViewController: BaseViewController {
    
    private let text: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setStyle() {
        text.do {
            $0.text = "Hi!"
            $0.font = .preferredFont(forTextStyle: .largeTitle)
        }
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubViews(text)
        view.enableAutoLayouts(text)
        
        text.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.centerY.equalTo(safeArea)
        }
    }
}

