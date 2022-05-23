//
//  ClientView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct ClientView: View {
  @State var client: Client

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("Pather name: ")
        Text("\(client.patherName)")
          .bold()
      }.font(.title3)
      Divider()
        .padding()
      Text("Passport info")
        .font(.title2.bold())
        .padding(.bottom)
      HStack {
        Text("Seria: ")
        Text("\(client.passportSeria)").bold()
      }.font(.title3)
        .padding(.bottom)
      HStack {
        Text("Number: ")
        Text("\(client.passportNumber)").bold()
      }.font(.title3)
        .padding(.bottom)
      Spacer()
    }
    .padding()
    .navigationTitle("\(client.firstName) \(client.lastName)")
    .navigationBarTitleDisplayMode(.large)
  }
}

struct ClientVIew_Previews: PreviewProvider {
  static var previews: some View {
    ClientView(client: Client(id: 1,
                              firstName: "abab",
                              lastName: "abab",
                              patherName: "abab",
                              passportSeria: "abab",
                              passportNumber: "abab"))
  }
}
