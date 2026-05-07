//
//  GetUsersListViewController.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/2/26.
//

import UIKit

import SnapKit
import Then

final class GetUsersListViewController: UIViewController {
    
    // MARK: - Property
    
    private var userList: [UserData] = []
    
    // MARK: - UI Component
    
    private let usersListTextView = UITextView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setStyle()
        setLayout()
        
        getUsersList()
    }
    
    // MARK: - Custom Methods
    
    private func setStyle() {
        view.backgroundColor = .white
        
        usersListTextView.do {
            $0.font = .systemFont(ofSize: 15)
            $0.isEditable = false
        }
    }
    
    private func setUI() {
        view.addSubview(usersListTextView)
    }
    
    private func setLayout() {
        usersListTextView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Private Methods
    
    private func getUsersList() {
        Task {
            do{
                let response = try await GetUsersListService.shared.getUsersList()
                userList = response
                updateUI(userList: userList)
                
                print("유저조회 성공")
            } catch {
                let alert = UIAlertController(
                    title: "유저조회 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert,animated: true)
                
                print("유저조회 실패", error)
            }
        }
    }
    
    private func updateUI(userList: [UserData]) {
        usersListTextView.text = userList
            .map {"id: \($0.id), 이름: \($0.name), 파트: \($0.part)"}
            .joined(separator: "\n")
    }
}
