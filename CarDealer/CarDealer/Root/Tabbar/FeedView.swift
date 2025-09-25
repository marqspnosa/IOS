//
//  FeedView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/25/25.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var carStore: DataStore<Car>
    @ObservedObject var likeStore: DataStore<Like>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(carStore.items) { car in
                    HStack {
                        AsyncImage(url: URL(string: car.imageURL)) { image in
                            image.resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 80, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack(alignment: .leading) {
                            Text("\(car.model) \(car.year)")
                                .font(.headline)
                            Text("$\(car.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        Button(action: {
                            toggleLike(for: car)
                        }) {
                            Image(systemName: isLiked(car) ? "heart.fill" : "heart")
                                .foregroundColor(isLiked(car) ? .red : .gray)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Explore Cars")
            .toolbar {
                Button("Add Samples") {
                    addSampleCars()
                }
            }
        }
    }
    
    private func isLiked(_ car: Car) -> Bool {
        likeStore.items.contains { $0.carId == car.id }
    }
    
    private func toggleLike(for car: Car) {
        if let like = likeStore.items.first(where: { $0.carId == car.id }) {
            likeStore.remove(id: like.id)
        } else {
            likeStore.add(Like(carId: car.id))
        }
    }
    
    private func addSampleCars() {
        let samples = [
            Car(model: "Tesla Model S", year: 2022, price: 79999,
                imageURL: "https://tesla-cdn.thron.com/delivery/public/image/tesla/44b7f62e-7b34-45c3-b274-4f8f8b57f8dd/bvlatuR/std/4096x2560/lhd-model-s-social"),
            Car(model: "Ford Mustang", year: 2021, price: 55999,
                imageURL: "https://cdn.motor1.com/images/mgl/BE22N/s3/2021-ford-mustang-mach-1.jpg"),
            Car(model: "BMW M3", year: 2020, price: 69999,
                imageURL: "https://www.bmwusa.com/content/dam/bmwusa/M/MY20/3Series/desktop/BMW-MY20-G80-M3-LCI-Desktop.jpg")
        ]
        for sample in samples {
            if !carStore.items.contains(where: { $0.model == sample.model }) {
                carStore.add(sample)
            }
        }
    }
}

