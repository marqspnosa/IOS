//
//  AuthManager.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/25/25.
//

import Foundation
import SwiftUI

@MainActor
class AuthManager: ObservableObject {
    @Published var isSignedIn: Bool = false
    @Published var userEmail: String = ""
    
    private let tokenKey = "mockAuthToken"
    private let emailKey = "mockAuthEmail"
    
    init() {
       
        if let token = UserDefaults.standard.string(forKey: tokenKey),
           !token.isEmpty,
           let savedEmail = UserDefaults.standard.string(forKey: emailKey) {
            self.isSignedIn = true
            self.userEmail = savedEmail
        }
    }
    
    func signIn(email: String, password: String) {
        // Mock: just save token/email
        UserDefaults.standard.set("fake-token", forKey: tokenKey)
        UserDefaults.standard.set(email, forKey: emailKey)
        self.userEmail = email
        self.isSignedIn = true
    }
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
        UserDefaults.standard.removeObject(forKey: emailKey)
        self.userEmail = ""
        self.isSignedIn = false
    }
}
