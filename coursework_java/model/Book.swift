//
//  Book.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct Book: Codable, Library {
  func isLibrary() -> Bool {
    true
  }
  
  let id: Int
  var name: String
  var count: Int
  var type: BookType
  
  
}
