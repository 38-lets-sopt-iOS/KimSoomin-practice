//
//  LoginService.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/7/26.
//

import Foundation

final class LoginService: BaseService {
    static let shared = LoginService()
    private override init() {}

    func postLogin(loginId: String, password: String) async throws -> LoginData {
        let loginDTO = LoginRequestDTO(loginId: loginId, password: password)
        let body = try JSONEncoder().encode(loginDTO)
        
        let request = try makeRequest(path: "api/v1/auth/signin", method: "POST", body: body)
        let response = try await fetchAndDecode(request: request, type: LoginResponseDTO.self)
        
        return response.data!
    }
}
