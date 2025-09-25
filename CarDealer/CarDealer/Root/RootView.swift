//
//  RootView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/25/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var auth = AuthManager()
    
    var body: some View {
        Group {
            if auth.isSignedIn {
                MainView()
                    .environmentObject(auth)
            } else {
                SignInView()
                    .environmentObject(auth)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
