//
//  ProfileView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/25/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var auth: AuthManager
    @State private var displayName = "John"
    @State private var avatarURL = ""

    var body: some View {
        NavigationView {
            Form {
                Section("Profile") {
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: avatarURL)) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            Circle().fill(Color.gray.opacity(0.3))
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(auth.userEmail)
                                .foregroundColor(.secondary)
                            TextField("Display Name", text: $displayName)
                        }
                    }
                }

                Section("Avatar") {
                    TextField("Avatar URL", text: $avatarURL)
                }

                Section {
                    Button(action: {
                        auth.signOut()
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}
