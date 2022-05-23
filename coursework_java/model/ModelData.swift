//
//  ModelData.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import Foundation

class ModelData {
  var bookTypes = [BookType]()

  var books = [Book]()

  var clients = [Client]()

  var journals = [Journal]()

  func loadData() async throws {
    let requestManager = RequestManager()
    bookTypes = try await requestManager.perform(BookTypeRequest.getAll)
    books = try await requestManager.perform(BookRequest.getAll)
    clients = try await requestManager.perform(ClientRequest.getAll)
    journals = try await requestManager.perform(JournalRequest.getAll)
  }
}
