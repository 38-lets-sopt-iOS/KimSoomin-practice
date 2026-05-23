//
//  UserInfoViewController.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/7/26.
//

import UIKit

import SnapKit
import Then

final class UserInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    var userId: Int = 1
    
    private var id: String = ""
    private var name: String = ""
    private var email: String = ""
    private var age: Int = 0
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var updateButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setStyle()
        setAddTarget()
        
        getUserInfo()
    }
    
    // MARK: - Custom Methods
    
    private func setUI() {
        view.addSubviews(titleLabel, idTextField, nameTextField, emailTextField, ageTextField ,partTextField, updateButton)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .head1
        }
        
        [idTextField, partTextField].forEach {
            $0.addLeftPadding()
            $0.borderStyle = .roundedRect
            $0.backgroundColor = .lightGray
            $0.isEnabled = false
        }
        
        [nameTextField, emailTextField, ageTextField].forEach {
            $0.addLeftPadding()
            $0.borderStyle = .roundedRect
            $0.backgroundColor = .white
            $0.isEnabled = true
        }
        
        updateButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        updateButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        [nameTextField, emailTextField, ageTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        updateButton.addTarget(self, action: #selector(updateButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Private Method
    
    private func getUserInfo() {
        Task {
            do {
                let userData = try await UserDetailService.shared.getUserInfo(userId: userId)
                
                idTextField.text = "\(userData.loginId ?? "")"
                nameTextField.text = userData.name
                emailTextField.text = userData.email
                ageTextField.text = "\(userData.age ?? 0)"
                partTextField.text = userData.part
                
                self.name = userData.name
                self.email = userData.email ?? ""
                self.age = userData.age ?? 0
            } catch {
                print("api 연결 실패")
            }
        }
    }
}

// MARK: - Extension

extension UserInfoViewController {
    @objc private func updateButtonDidTap() {
        Task {
            do {
                let _ = try await UserDetailService.shared.updateUserInfo(
                    userId: self.userId,
                    name: self.name,
                    email: self.email,
                    age: self.age
                )
                
                let alert = UIAlertController(title: "유저 정보를 수정했습니다", message: "수정 완료", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
                
            } catch {
                print("수정 실패")
            }
        }
    }
    
    @objc private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case nameTextField: name = textField.text ?? ""
        case emailTextField: email = textField.text ?? ""
        case ageTextField: age = Int(textField.text ?? "") ?? 0
        default: break
        }
    }
    
    @objc private func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}
