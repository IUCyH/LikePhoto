//
//  BaseViewController.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    let dataManager: DataManager = DataManager()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    /// Set properties of all sub views in this view
    func setStyle() {
        
    }
    
    /// Set position of all sub views in this view
    func setLayout() {
        
    }
    
    /// Use this if you want to use auto layout
    final func enableAutoLayouts(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
