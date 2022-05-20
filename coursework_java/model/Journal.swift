//
//  Journal.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct Journal: Codable {
  let id: Int
  var books: [Book]
  var clients: [Client]
  var beginDate, endDate, returnDate: String
}

