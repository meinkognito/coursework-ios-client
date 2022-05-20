//
//  BookType.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct BookType: Codable {
  let id: Int
  var name: String
  var count, fine, dayCount: Int
}
