//
//  UserDetailService.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/7/26.
//

import Foundation

final class UserDetailService: BaseService {
    static let shared = UserDetailService()
    private override init() {}

    func getUserInfo(userId: Int) async throws -> UserData {
        let request = try makeRequest(path: "api/v1/users/\(userId)", method: "GET")
        let response = try await fetchAndDecode(request: request, type: UserDetailResponseDTO.self)
        
        return response.data
    }

    func updateUserInfo(userId: Int, name: String?, email: String?, age: Int?) async throws -> UserData {
        let updateDTO = UserUpdateRequestDTO(name: name, email: email, age: age)
        let body = try JSONEncoder().encode(updateDTO)
        
        let request = try makeRequest(path: "api/v1/users/\(userId)", method: "PATCH", body: body)
        let response = try await fetchAndDecode(request: request, type: UserDetailResponseDTO.self)
        
        return response.data
    }
}
