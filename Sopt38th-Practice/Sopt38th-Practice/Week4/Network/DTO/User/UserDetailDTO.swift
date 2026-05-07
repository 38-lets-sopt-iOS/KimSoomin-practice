//
//  UserDetailDTO.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/7/26.
//

import Foundation

struct UserDetailResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserData
}

struct UserData: Decodable {
    let id: Int
    let name: String
    let part: String
    let loginId: String?
    let email: String?
    let age: Int?
}
