//
//  GetUsersListService.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/2/26.
//

import Foundation

final class GetUsersListService: BaseService {
    static let shared = GetUsersListService()
    private override init() {}

    func getUsersList() async throws -> [UserData] {
        let request = try makeRequest(path: "api/v1/users", method: "GET")
        let response = try await fetchAndDecode(request: request, type: GetUsersListResponseDTO.self)
        
        return response.data.users
    }
}
