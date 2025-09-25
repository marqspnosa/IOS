//
//  MainView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/21/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var auth = AuthManager()
    @StateObject private var carStore = DataStore<Car>(storageKey: "cars")
    @StateObject private var likeStore = DataStore<Like>(storageKey: "likes")
    @State private var selectedTab = 0

    var body: some View {
        Group {
            if auth.isSignedIn {
                TabView(selection: $selectedTab) {
                    FeedView(carStore: carStore, likeStore: likeStore)
                        .tabItem { Label("Explore", systemImage: "magnifyingglass") }
                        .tag(0)

                    SellView(carStore: carStore)
                        .tabItem { Label("Sell", systemImage: "car") }
                        .tag(1)

                    FavoritesView(carStore: carStore, likeStore: likeStore)
                        .tabItem { Label("Favorites", systemImage: "heart") }
                        .tag(2)

                    ProfileView()
                        .environmentObject(auth)
                        .tabItem { Label("Profile", systemImage: "person") }
                        .tag(3)
                }
            } else {
                SignInView()
                    .environmentObject(auth)
            }
        }
        .animation(.default, value: auth.isSignedIn)
        .onAppear {
            if carStore.items.isEmpty {
                addSampleCars()
            }
        }
    }

    private func addSampleCars() {
        let samples = [
            Car(model: "Tesla Model S", year: 2022, price: 79999, imageURL: "https://tesla-cdn.thron.com/delivery/public/image/tesla/44b7f62e-7b34-45c3-b274-4f8f8b57f8dd/bvlatuR/std/4096x2560/lhd-model-s-social"),
            Car(model: "Ford Mustang", year: 2021, price: 55999, imageURL: "https://cdn.motor1.com/images/mgl/BE22N/s3/2021-ford-mustang-mach-1.jpg"),
            Car(model: "BMW M3", year: 2020, price: 69999, imageURL: "https://www.bmwusa.com/content/dam/bmwusa/M/MY20/3Series/desktop/BMW-MY20-G80-M3-LCI-Desktop.jpg")
        ]
        for sample in samples {
            if !carStore.items.contains(where: { $0.model == sample.model }) {
                carStore.add(sample)
            }
        }
    }
}

        struct MainView_Previews: PreviewProvider {
            static var previews: some View {
                MainView()
            }
        }

