//
//  AuthManager.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/20/22.
//

import Foundation

protocol AuthManagerProtocol {
  func requestToken() async throws -> Data
}

class AuthManager: AuthManagerProtocol {
  private let urlSession: URLSession

  init(urlSession: URLSession = URLSession.shared) {
    self.urlSession = urlSession
  }

  func perform(_ request: RequestProtocol, authToken: String = "") async throws -> Data {
    let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
    guard let httpResponse = response as? HTTPURLResponse,
      httpResponse.statusCode == 200 else { throw NetworkError.invalidServerResponse }
    return data
  }

  func requestToken() async throws -> Data {
    try await perform(AuthTokenRequest.auth)
  }
}
