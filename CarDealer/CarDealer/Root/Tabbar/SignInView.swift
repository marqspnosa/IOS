//
//  SignInView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/25/25.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var auth: AuthManager
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to Car Dealer App")
                    .font(.title)
                    .padding(.bottom, 30)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Sign In") {
                    auth.signIn(email: email, password: password)
                }
                .buttonStyle(PillButtonStyle())
                .padding(.top, 20)
            }
            .padding()
            .navigationTitle("Sign In")
        }
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
