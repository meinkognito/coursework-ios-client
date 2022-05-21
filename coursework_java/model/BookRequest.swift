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

  case addBook(book: Book)

  case updateBook(id: Int, with: Book)

  case deleteBook(id: Int)

  var path: String {
    switch self {
    case .getAllBooks: return "/books"
    case let .getBookById(id): return "/book/\(id)"
    case .addBook: return "/addBook"
    case let .updateBook(id, _): return "/updateBook/\(id)"
    case let .deleteBook(id): return "/deleteBook/\(id)"
    }
  }

  var params: [String: Any] {
    switch self {
    case .getAllBooks, .getBookById, .deleteBook: return [:]
    case let .addBook(book), let .updateBook(_, book):
      var params: [String: Book] = [:]
      params["empty"] = book
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
