//
//  ClientsView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct ClientsView: View {
  @Binding var journal: Journal
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        NavigationLink {
          AddClient(clients: $journal.clients)
            .onDisappear {
              Task {
                let _: Journal = try await RequestManager().perform(
                  JournalRequest.update(id: journal.id, with:
                    Journal(
                      id: journal.id,
                      books: journal.books,
                      clients: journal.clients,
                      beginDate: journal.beginDate,
                      endDate: journal.endDate,
                      returnDate: journal.returnDate
                    ))
                )
              }
            }
        } label: {
          Image(systemName: "plus")
            .foregroundColor(.accentColor)
        }.padding()
      }
      List {
        ForEach(journal.clients) { client in
          NavigationLink {
            ClientView(client: client, clients: $journal.clients)
              .onDisappear {
                Task {
                  let _: Journal = try await RequestManager().perform(
                    JournalRequest.update(id: journal.id, with:
                      Journal(
                        id: journal.id,
                        books: journal.books,
                        clients: journal.clients,
                        beginDate: journal.beginDate,
                        endDate: journal.endDate,
                        returnDate: journal.returnDate
                      ))
                  )
                }
              }
          }

            label: {
              Text("\(client.firstName) \(client.lastName)")
            }
        }.onDelete { index in
          journal.clients.remove(atOffsets: index)
          Task {
            let _: Journal = try await RequestManager().perform(
              JournalRequest.update(id: journal.id, with:
                Journal(
                  id: journal.id,
                  books: journal.books,
                  clients: journal.clients,
                  beginDate: journal.beginDate,
                  endDate: journal.endDate,
                  returnDate: journal.returnDate
                ))
            )
          }
        }
      }
    }
  }
}
