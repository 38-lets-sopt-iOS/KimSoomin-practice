//
//  LoginViewController_AutoLayout.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 4/11/26.
//

import UIKit

final class LoginViewController_AutoLayout: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 164, width: 240, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.font = .subhead1
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var segmentControl: UISegmentedControl = {
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
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 290, y: 420, width: 80, height: 20))
        button.setTitle("비밀번호 보기", for: .normal)
        button.titleLabel?.textAlignment = .right
        button.setTitleColor(.grey300, for: .normal)
        button.titleLabel?.font = .info
        button.addTarget(self, action: #selector(didTapShowPasswordButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
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
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        view.addSubviews(titleLabel, segmentControl, idTextField, passwordTextField, showPasswordButton, loginButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        showPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            segmentControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentControl.heightAnchor.constraint(equalToConstant: 36),

            idTextField.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 30),
            idTextField.leadingAnchor.constraint(equalTo: segmentControl.leadingAnchor),
            idTextField.trailingAnchor.constraint(equalTo: segmentControl.trailingAnchor),
            idTextField.heightAnchor.constraint(equalToConstant: 52),

            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
            passwordTextField.leadingAnchor.constraint(equalTo: idTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),

            showPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            showPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            showPasswordButton.widthAnchor.constraint(equalToConstant: 100),
            showPasswordButton.heightAnchor.constraint(equalToConstant: 20),

            loginButton.topAnchor.constraint(equalTo: showPasswordButton.bottomAnchor, constant: 80),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 57)
        ])
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

extension LoginViewController_AutoLayout: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
