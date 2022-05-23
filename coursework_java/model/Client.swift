//
//  Client.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct Client: Codable, Identifiable, Hashable {
  let id: Int
  var firstName, lastName, patherName, passportSeria: String
  var passportNumber: String
}

private actor ClientServiceStore {
  private var loadedItems = [Client]()

  func load() async throws -> [Client] {
    return try await RequestManager().perform(ClientRequest.getAll)
  }
}

class ClientService: ObservableObject {
  private let store = ClientServiceStore()
  @Published var items = [Client]()

  public init() {}
}

extension ClientService {
  @MainActor
  func fetch() async throws {
    items = try await store.load()
  }
}
