//
//  BookRequest.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import Foundation

enum BookRequest: RequestProtocol {
  case getAllBooks
  case getBookById(id: Int)

  case addBook

  case updateBook(id: Int)

  case deleteBook(id: Int)

  var path: String {
    switch self {
    case .getAllBooks: return "/books"
    case let .getBookById(id): return "/book\(id)"
    case .addBook: return "/addBook"
    case let .updateBook(id): return "/updateBook\(id)"
    case let .deleteBook(id): return "/deleteBook\(id)"
    }
  }

  var urlParams: [String: String?] {
    switch self {
    case .getAllBooks, .addBook:
      return [:]

    case let .getBookById(id), let .updateBook(id), let .deleteBook(id):
      var params: [String: String] = [:]
      params["id"] = String(id)
      return params
    }
  }

  var requestType: RequestType {
    switch self {
    case .getAllBooks, .getBookById: return .GET
    case .addBook: return .POST
    case .updateBook: return .PUT
    case .deleteBook: return .DELETE
    }
  }
}
