//
//  ClientsView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct ClientsView: View {
  @State var clients: [Client]
  var body: some View {
    List {
      ForEach(clients) { client in
        NavigationLink {
          ClientView(client: client)
        } label: {
          Text("\(client.firstName) \(client.lastName)")
        }
      }
    }
  }
}

struct ClientsView_Previews: PreviewProvider {
    static var previews: some View {
        ClientsView(clients: [])
    }
}
