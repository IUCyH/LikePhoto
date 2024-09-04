//
//  UIView+.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit

extension UIView {
    
    func addSubViews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
    
    func enableAutoLayouts(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
