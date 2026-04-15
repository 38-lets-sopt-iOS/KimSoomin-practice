//
//  UIView+.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/7/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

