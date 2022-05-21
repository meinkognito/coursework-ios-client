//
//  RequestManager.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import Foundation

protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

final class RequestManager: RequestManagerProtocol {
  let authManager: AuthManagerProtocol
  let parser: DataParserProtocol

  init(
    apiManager: AuthManagerProtocol = AuthManager(),
    parser: DataParserProtocol = DataParser()
  ) {
    authManager = apiManager
    self.parser = parser
  }

  func requestAccessToken() async throws -> String {
    let data = try await authManager.requestToken()
    let token: Token = try parser.parse(data: data)
    return token.token
  }

  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
    let authToken = try await requestAccessToken()
    let data = try await authManager.perform(request, authToken: authToken)
    let decoded: T = try parser.parse(data: data)
    return decoded
  }
}
