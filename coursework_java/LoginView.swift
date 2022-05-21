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

        SecureField("Password:", text: self.$password)
          .padding()
          .background(.bar)
          .padding()
      }
      Button("Login", action: {
//        Task {
//          do {
//            let authManager = AuthManager()
//            let res = try await authManager.requestToken()
//            print(String(data: res, encoding: .utf8)!)
//          } catch {
//            print("error")
//          }
//        }
//        Task {
//          do {
//            let requestManager = RequestManager()
//            let data: [Book] = try await requestManager.perform(BookRequest.getAllBooks)
//            print(data)
//
//          } catch {
//            print(error.localizedDescription)
//          }
//        }
        
        

      })
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
