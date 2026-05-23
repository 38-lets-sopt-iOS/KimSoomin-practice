//
//  SignupService.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/2/26.
//

import Foundation

final class SignupService: BaseService {
    static let shared = SignupService()
    private override init() {}

    func postSignup(loginId: String, password: String, name: String, email: String, age: Int, part: String) async throws -> SignupResponseDTO {
        let signupDTO = SignupRequestDTO(loginId: loginId, password: password, name: name, email: email, age: age, part: part)
        let body = try JSONEncoder().encode(signupDTO)
        
        let request = try makeRequest(path: "api/v1/auth/signup", method: "POST", body: body)
        return try await fetchAndDecode(request: request, type: SignupResponseDTO.self)
    }
}

