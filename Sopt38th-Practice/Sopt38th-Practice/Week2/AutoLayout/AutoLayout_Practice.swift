//
//  AutoLayout_Practice.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/11/26.
//

import UIKit

final class AutoLayout_Practice: UIViewController {
    let yellow: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let white: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let green: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let blue: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let black: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
    }
    
    
    func setUI() {
        view.addSubviews(yellow, white, green, blue, black)
        
        yellow.translatesAutoresizingMaskIntoConstraints = false
        green.translatesAutoresizingMaskIntoConstraints = false
        blue.translatesAutoresizingMaskIntoConstraints = false
        black.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            yellow.topAnchor.constraint(equalTo: view.topAnchor),
            yellow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellow.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            yellow.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0 / 4.0),
            
            green.topAnchor.constraint(equalTo: yellow.bottomAnchor),
            green.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            green.widthAnchor.constraint(equalTo: yellow.widthAnchor),
            green.heightAnchor.constraint(equalTo: yellow.heightAnchor),
            
            black.topAnchor.constraint(equalTo: green.bottomAnchor),
            black.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            black.widthAnchor.constraint(equalTo: yellow.widthAnchor),
            black.heightAnchor.constraint(equalTo: yellow.heightAnchor),
            
            blue.topAnchor.constraint(equalTo: black.bottomAnchor),
            blue.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blue.widthAnchor.constraint(equalTo: yellow.widthAnchor),
            blue.heightAnchor.constraint(equalTo: yellow.heightAnchor),
        ])
    }
}
