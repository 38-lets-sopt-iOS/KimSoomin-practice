//
//  BaseService.swift
//  Sopt38th-Practice
//
//  Created by mandoo on 5/8/26.
//

import Foundation

class BaseService {
    func makeRequest(path: String, method: String, body: Data? = nil) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = body {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request Body: \(str)")
        }
        
        return request
    }

    func fetchAndDecode<T: Decodable>(request: URLRequest, type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        if let responseString = String(data: data, encoding: .utf8) {
            print("Response Body: \(responseString)")
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError(rawValue: httpResponse.statusCode) ?? NetworkError.unknownError
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
