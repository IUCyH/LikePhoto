//
//  UIStackView+.swift
//  SNS_Practice
//
//  Created by Jaemin Hong on 9/4/24.
// 

import UIKit

extension UIStackView {
    
    final func addArrangedSubviews(_ views: UIView...) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
