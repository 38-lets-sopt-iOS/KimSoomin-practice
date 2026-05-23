//
//  GetUsersListResponseDTO.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/2/26.
//

import Foundation

struct GetUsersListResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UsersData
}

struct UsersData: Decodable {
    let users: [UserData]
}
