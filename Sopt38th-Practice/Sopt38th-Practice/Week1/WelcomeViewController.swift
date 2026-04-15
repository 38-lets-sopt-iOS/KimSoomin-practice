//
//  WelcomeViewController.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/4/26.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    
    private var id: String?
    
    // MARK: - UI Components
    
    private let dangeunImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 122, y: 97, width: 150, height: 150))
        imageView.image = UIImage(named: "dangeun")
        
        return imageView
    }()
    
    private let welcomLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 305, width: 95, height: 60))
        label.textColor = .black
        label.font = .title
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private let goMainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 436, width: 335, height: 57))
        button.setTitle("메인으로", for: .normal)
        button.backgroundColor = .primaryOrange
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    lazy var reLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 508, width: 335, height: 57))
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.grey300, for: .normal)
        button.backgroundColor = .grey200
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(didTapReLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        view.addSubviews(dangeunImageView, welcomLabel, goMainButton, reLoginButton)
    }
    
    // MARK: - Action
    
    @objc func didTapReLoginButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // MARK: - Public Method
    
    func configure(id: String?) {
        self.id = id
        if let id = id, !id.isEmpty {
            welcomLabel.text = "\(id)님\n반가워요!"
        }
        else {
            welcomLabel.text = "사용자님\n반가워요!"
        }
    }
}
