//
//  LoginViewController_AutoLayout.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/11/26.
//

import UIKit

import SnapKit

final class LoginViewController_Snapkit: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subhead1
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["아이디로 로그인", "전화번호로 로그인"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(didChangeSegmentControl), for: .valueChanged)
        
        return segmentControl
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.backgroundColor = .grey200
        textField.font = .subhead4
        textField.textColor = .appBlack
        textField.layer.cornerRadius = 3
        textField.addLeftPadding()
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
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
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 보기", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = .info
        button.addTarget(self, action: #selector(didTapShowPasswordButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
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
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        view.addSubviews(titleLabel, segmentControl, idTextField, passwordTextField, showPasswordButton, loginButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(169)
            $0.horizontalEdges.equalToSuperview().inset(77)
        }
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(36)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(30)
            $0.horizontalEdges.equalTo(segmentControl)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalTo(idTextField)
            $0.height.equalTo(52)
        }
        
        showPasswordButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.trailing.equalTo(passwordTextField)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(showPasswordButton.snp.bottom).offset(80)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
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
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.configure(id: idTextField.text)
        welcomeViewController.backToLoginCompletion = { [weak self] data in
            guard let self else { return }
            print("데이터는 바로바로 \(data)")
            self.titleLabel.text = "\(data)님, 다시 로그인해야해요."
            self.idTextField.text = ""
            self.passwordTextField.text = ""
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

// MARK: - Extension

extension LoginViewController_Snapkit: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
