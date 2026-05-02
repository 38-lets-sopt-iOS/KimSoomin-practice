//
//  ChatTableViewCell.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/25/26.
//

import UIKit

import Then
import SnapKit

class ChatTableViewCell: UITableViewCell {
     
    // MARK: - Property
    
    static let identifier = "ChatTableViewCell"
    
    // MARK: - UI Components
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let userNameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    private let locationLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .info2
        $0.textColor = .grey300
    }
    
    private let messageLabel = UILabel().then {
        $0.textAlignment = .left
        $0.font = .subhead3
    }
    
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        contentView.addSubviews(profileImageView, userNameLabel, locationLabel, messageLabel, productImageView)
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().inset(16.5)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(userNameLabel)
            $0.leading.equalTo(userNameLabel.snp.trailing).offset(4)
        }
        
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(userNameLabel)
            $0.top.equalTo(userNameLabel.snp.bottom).offset(4)
        }
        
        productImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(50)
        }
    }
}

// MARK: - Extension

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        userNameLabel.text = chatData.name
        locationLabel.text = chatData.place
        messageLabel.text = chatData.message
        productImageView.image = chatData.itemImg
    }
}
