//
//  SignupRequestDTO.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/2/26.
//

import Foundation

struct SignupRequestDTO: Encodable {
    let loginId: String
    let password: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
