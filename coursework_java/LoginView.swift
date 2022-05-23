//
//  LoginView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import SwiftUI

struct LoginView: View {
  @State private var login = User.user.username
  @State private var password = User.user.password
  var modelData = ModelData()
  @State private var showingAlert = false
  @State private var showingSheet = false

  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text("Welcome")
          .font(.largeTitle.bold())
          .padding()

        TextField("Login:", text: self.$login)
          .padding()
          .background(.bar)
          .padding(.horizontal)
          .textInputAutocapitalization(.never)

        SecureField("Password:", text: self.$password)
          .padding()
          .background(.bar)
          .padding()
          .textInputAutocapitalization(.never)
      }
      Button("Login", action: {
        Task {
          do {
            try await validateToken(username: login)
            showingSheet = true
          } catch {
            print(error.localizedDescription)
            showingAlert = true
          }
        }
      })
      .sheet(isPresented: $showingSheet) {
        BooksView()
      }
      .alert("Invalid credentials!", isPresented: $showingAlert, actions: {})
      .buttonStyle(.bordered)
      .foregroundColor(.black)
      .font(.title3.bold())
      .padding()
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
      .previewDevice("iPhone 12")
  }
}
