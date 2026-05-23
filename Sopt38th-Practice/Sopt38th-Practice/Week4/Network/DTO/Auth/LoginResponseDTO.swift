//
//  LoginResponseDTO.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/7/26.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: LoginData?
}

struct LoginData: Decodable {
    let userId: Int
}
