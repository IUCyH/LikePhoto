//
//  BaseView.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit

class BaseView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Set properties of all sub views in this view
    func setStyle() {
        
    }
    
    /// Set position of all sub views in this view
    func setLayout() {
        
    }
}
