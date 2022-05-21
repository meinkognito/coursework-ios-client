//
//  MainView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/20/22.
//

import SwiftUI

struct MainView: View {
  private var requestManager = RequestManager()

  var body: some View {
    VStack(alignment: .center, spacing: 15) {
      Button(action: {
        Task {
          do {
            let books: [Book] = try await requestManager.perform(BookRequest.getAllBooks)
            print(books)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("getAllBooks") })

      Button(action: {
        Task {
          do {
            let book: Book = try await requestManager.perform(BookRequest.getBookById(id: 1))
            print(book)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("get 1st book") })

      Button(action: {
        Task {
          do {
            let newBook: Book = try await requestManager.perform(BookRequest.addBook(book:
              Book(id: 7, name: "newbook", count: 10, type:
                BookType(
                  id: 1,
                  name: "newType",
                  count: 10,
                  fine: 10,
                  dayCount: 10
                ))))
            print(newBook)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("add book") })
      
      Button(action: {
        Task {
          do {
            let updatedBook: Book = try await requestManager.perform(BookRequest.updateBook(id: 1, with:
              Book(id: 7, name: "newbook", count: 10, type:
                BookType(
                  id: 1,
                  name: "newType",
                  count: 10,
                  fine: 10,
                  dayCount: 10
                ))))
            print(updatedBook)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("update book") })
      
      Button(action: {
        Task {
          do {
            let book: Book = try await requestManager.perform(BookRequest.deleteBook(id: 1))
            print(book)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("delete 1st book") })
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
