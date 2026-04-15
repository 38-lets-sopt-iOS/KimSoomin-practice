//
//  LoginViewController.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/4/26.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 164, width: 240, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subhead1
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["아이디로 로그인", "전화번호로 로그인"])
        segmentControl.frame = CGRect(x: 30, y: 230, width: 335, height: 36)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(didChangeSegmentControl), for: .valueChanged)
        
        return segmentControl
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 296, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.backgroundColor = .grey200
        textField.font = .subhead4
        textField.textColor = .appBlack
        textField.layer.cornerRadius = 3
        textField.addLeftPadding()
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 355, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = .grey200
        textField.font = .subhead4
        textField.textColor = .appBlack
        textField.layer.cornerRadius = 3
        textField.addLeftPadding()
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    private lazy var showPasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 290, y: 420, width: 80, height: 20))
        button.setTitle("비밀번호 보기", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = .info
        button.addTarget(self, action: #selector(didTapShowPasswordButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 535, width: 335, height: 57))
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .primaryOrange
        button.titleLabel?.font = .subhead1
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        
        setUI()
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        view.addSubviews(titleLabel, segmentControl, idTextField, passwordTextField, showPasswordButton, loginButton)
    }
    
    // MARK: - Actions
    
    @objc func didTapLoginButton() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    @objc func didTapShowPasswordButton() {
        passwordTextField.isSecureTextEntry.toggle()
        
        let isSecure = passwordTextField.isSecureTextEntry
        let title = isSecure ? "비밀번호 보기" : "비밀번호 숨기기"
        
        showPasswordButton.setTitle(title, for: .normal)
    }
    
    @objc func didChangeSegmentControl() {
        segmentControl.selectedSegmentIndex == 0 ? (idTextField.placeholder = "아이디") : (idTextField.placeholder = "전화번호 ( '-' 제외하고 입력해주세요 )")
    }
    
    // MARK: - Private Methods
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.configure(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.configure(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

// MARK: - Extension

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
