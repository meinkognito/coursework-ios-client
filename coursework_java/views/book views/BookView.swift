//
//  BookView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct BookView: View {
  @Environment(\.editMode) var editMode
  @State var book: Book
  @State private var draftBook = Book()
  @Binding var books: [Book]
  @State private var index = 0

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        if editMode?.wrappedValue == .active {
          Button("Cancel", role: .cancel) {
            draftBook = book
            editMode?.animation().wrappedValue = .inactive
          }
        }

        Spacer()
        EditButton()
      }

      if editMode?.wrappedValue == .inactive {
        BookInfo(book: book)
      } else {
        BookEditor(book: $draftBook)
          .onAppear {
            draftBook = book
          }
          .onDisappear {
            book = draftBook
            Task {
              do {
                let _: Book = try await RequestManager().perform(
                  BookRequest.update(id: book.id, with: draftBook)
                )
                books[index] = book
              } catch {
                print(error.localizedDescription)
              }
            }
          }
      }
    }
    .onAppear {
      draftBook = book
      index = books.firstIndex(of: book) ?? 0
    }
    .padding()
  }
}

// struct BookView_Previews: PreviewProvider {
//  static var previews: some View {
//    BookView(book:
//      Book(id: 7, name: "newbook", count: 10, type:
//        BookType(
//          id: 1,
//          name: "newType",
//          count: 10,
//          fine: 10,
//          dayCount: 10
//        )))
//  }
// }
