//
//  UIView+.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit

extension UIView {
    
    final func addSubViews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
    
    /// Use this if you want to use auto layout
    final func enableAutoLayouts(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    final func makeRoundedCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
