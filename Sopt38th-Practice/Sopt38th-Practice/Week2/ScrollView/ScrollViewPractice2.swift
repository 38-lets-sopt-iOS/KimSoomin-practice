//
//  ScrollViewPractice2.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/11/26.
//

import UIKit

import SnapKit

class ScrollViewPractice2: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let red = UIView()
    private let orange = UIView()
    private let yellow = UIView()
    private let green = UIView()
    private let blue = UIView()
    private let purple = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        red.backgroundColor = .red
        orange.backgroundColor = .orange
        yellow.backgroundColor = .yellow
        green.backgroundColor = .green
        blue.backgroundColor = .blue
        purple.backgroundColor = .purple
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(red, orange, yellow, green, blue, purple)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualTo(scrollView.snp.height)
        }
        
        red.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        
        orange.snp.makeConstraints {
            $0.top.equalTo(red.snp.top)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        
        yellow.snp.makeConstraints {
            $0.top.equalTo(red.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        
        green.snp.makeConstraints {
            $0.top.equalTo(orange.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(view.frame.width * 0.5)
        }
        
        blue.snp.makeConstraints {
            $0.top.equalTo(yellow.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(view.frame.width * 0.5)
            $0.bottom.equalToSuperview()
        }
        
        purple.snp.makeConstraints {
            $0.top.equalTo(green.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(view.frame.width * 0.5)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
        }
    }
}
