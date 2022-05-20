//
//  Client.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct Client: Codable {
  let id: Int
  var firstName, lastName, patherName, passportSeria: String
  var passportNumber: String
}
