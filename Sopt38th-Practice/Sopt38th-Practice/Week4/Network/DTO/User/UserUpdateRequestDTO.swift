//
//  UserUpdateRequestDTO.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/7/26.
//

import Foundation

struct UserUpdateRequestDTO: Encodable {
    let name: String?
    let email: String?
    let age: Int?
}
