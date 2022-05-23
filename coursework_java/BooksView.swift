//
//  BooksView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import SwiftUI

struct BooksView: View {
  @ObservedObject var modelData = ModelData()
  var body: some View {
    NavigationView {
      List {}
    }
  }
}

struct BooksView_Previews: PreviewProvider {
  static var previews: some View {
    BooksView()
  }
}
