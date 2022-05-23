//
//  JournalsView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct JournalsView: View {
  @StateObject var pageRouter: PageRouter
  @StateObject var journalService = JournalService()

  var body: some View {
    NavigationView {
      List {
        ForEach(journalService.items) { item in
          NavigationLink {
            JournalView(journal: item)
          } label: {
            Text("Journal - \(item.id)")
          }
        }
      }.onAppear {
        Task {
          try? await journalService.fetch()
        }
      }
      .navigationBarTitle("Journals")
      .navigationBarItems(trailing:
        Button(
          action: {
            pageRouter.currentPage = .login
          }, label: {
            Image(systemName: "rectangle.portrait.and.arrow.right")
              .foregroundColor(.black)
          }
        ))
    }
  }

//  func delete(at offsets: IndexSet) {
//    Task {
//      let requestManager = RequestManager()
//      do {
//        let _: Journal = try await requestManager.perform(JournalRequest.delete(id: offsets.first!))
//      } catch {
//        print(error.localizedDescription)
//      }
//      journals.remove(atOffsets: offsets)
//    }
//  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    JournalsView(pageRouter: PageRouter())
  }
}
