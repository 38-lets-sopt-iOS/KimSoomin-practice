//
//  ItemCollectionViewCell.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/25/26.
//

import UIKit

import SnapKit
import Then

protocol ItemCollectionViewCellDelegate: AnyObject {
    func heartButtonDidTap(cell: ItemCollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "ItemCollectionViewCell"
    weak var delegate: ItemCollectionViewCellDelegate?
    
    // MARK: - UI Components
    
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let productNameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .subhead1
    }
    
    private let priceLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .subhead3
        $0.textColor = .primaryOrange
    }
    
    lazy var heartButton = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        $0.tintColor = .systemRed
        $0.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        contentView.addSubviews(productImageView, productNameLabel, priceLabel, heartButton)
    }
    
    private func setLayout() {
        productImageView.snp.makeConstraints {
            $0.centerX.top.equalToSuperview()
            $0.size.equalTo(139)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView)
            $0.top.equalTo(productImageView.snp.bottom).offset(6)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(productImageView)
            $0.top.equalTo(productNameLabel.snp.bottom).offset(2)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(productImageView).inset(8)
            $0.size.equalTo(20)
        }
    }
    
    // MARK: - Action
    
    @objc private func heartButtonDidTap(){
        delegate?.heartButtonDidTap(cell: self)
    }
}

// MARK: - Extension

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel) {
        productImageView.image = itemData.itemImg
        productNameLabel.text = itemData.name
        priceLabel.text = itemData.price
    }
}
