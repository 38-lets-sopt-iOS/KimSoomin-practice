//
//  UIFont+.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/7/26.
//

import UIKit

extension UIFont {
    static let title: UIFont = UIFont(name: "Pretendard-ExtraBold", size: 25) ?? .systemFont(ofSize: 25, weight: .bold)
    
    static let head1: UIFont = UIFont(name: "Pretendard-SemiBold", size: 30) ?? .systemFont(ofSize: 30, weight: .semibold)
    
    static let subhead1: UIFont = UIFont(name: "Pretendard-Bold", size: 18) ?? .systemFont(ofSize: 18, weight: .bold)
    
    static let subhead2: UIFont = UIFont(name: "Pretendard-SemiBold", size: 16) ?? .systemFont(ofSize: 16, weight: .semibold)
    
    static let subhead3: UIFont = UIFont(name: "Pretendard-SemiBold", size: 15) ?? .systemFont(ofSize: 15, weight: .semibold)
    
    static let subhead4: UIFont = UIFont(name: "Pretendard-SemiBold", size: 14) ?? .systemFont(ofSize: 14, weight: .semibold)
    
    static let info: UIFont = UIFont(name: "Pretendard-Regular", size: 12) ?? .systemFont(ofSize: 12, weight: .regular)
    
    static let info2: UIFont = UIFont(name: "Pretendard-Regular", size: 10) ?? .systemFont(ofSize: 10, weight: .regular)
}
