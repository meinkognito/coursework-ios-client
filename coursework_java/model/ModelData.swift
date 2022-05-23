//
//  ModelData.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import Foundation

class ModelData: ObservableObject {
  @Published var bookTypes = [BookType]()

  @Published var books = [Book]()

  @Published var clients = [Client]()

  @Published var journals = [Journal]()

  func loadData() async {
    do {
      let requestManager = RequestManager()
      bookTypes = try await requestManager.perform(BookTypeRequest.getAll)
      books = try await requestManager.perform(BookRequest.getAll)
      clients = try await requestManager.perform(ClientRequest.getAll)
      journals = try await requestManager.perform(JournalRequest.getAll)
    } catch {
      print(error.localizedDescription)
    }
  }
}
