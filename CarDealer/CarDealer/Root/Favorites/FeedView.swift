//
//  FeedView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/22/25.
//

import Foundation
import Swift

struct FeedView: View {
    var body: some View {
        Text("Feed / Explore Screen")
            .font(.title)
            .padding()
    }
}

struct SellView: View {
    var body: some View {
        Text("Sell a Car Screen")
            .font(.title)
            .padding()
    }
}

struct LikesView: View {
    var body: some View {
        Text("Favorites Screen")
            .font(.title)
            .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
            .font(.title)
            .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
