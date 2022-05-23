//
//  JournalView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

enum JournalTab {
  case books
  case clients
}

struct JournalView: View {
  @State var tab: JournalTab = .books
  @State var journal: Journal
  @State private var navTitle = ""

  var body: some View {
    TabView {
      BooksView(books: journal.books)
        .tag(JournalTab.books)
        .tabItem {
          Image(systemName: "books.vertical")
          Text("Books")
        }

      ClientsView(clients: journal.clients)
        .tag(JournalTab.clients)
        .tabItem {
          Image(systemName: "person.2")
          Text("Clients")
        }
    }
    .navigationTitle("Journal \(journal.id)")
  }
}

struct JournalView_Previews: PreviewProvider {
  static var previews: some View {
    JournalView(journal: Journal(id: 1, books: [], clients: [], beginDate: "abab", endDate: "abab", returnDate: "abab"))
//      .environmentObject(ModelData())
  }
}
