//
//  FavoritesView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/22/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var carStore: DataStore<Car>
    @ObservedObject var likeStore: DataStore<Like>
    
    var likedCars: [Car] {
        carStore.items.filter { car in
            likeStore.items.contains { $0.carId == car.id }
        }
    }
    
    var body: some View {
        NavigationView {
            List(likedCars) { car in
                HStack {
                    AsyncImage(url: URL(string: car.imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment: .leading) {
                        Text("\(car.model) \(car.year)")
                        Text("$\(car.price, specifier: "")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
