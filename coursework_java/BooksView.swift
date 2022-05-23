//
//  BookView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct BooksView: View {
  @State var books: [Book]

  var body: some View {
    List {
      ForEach(books) { book in
        NavigationLink {
          BookView(book: book)
        } label: {
          Text(book.name)
        }
      }
    }
  }
}

struct BooksView_Previews: PreviewProvider {
  static var previews: some View {
    BooksView(books: [])
  }
}
