//
//  SellView.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/25/25.
//

import SwiftUI

struct SellView: View {
    @ObservedObject var carStore: DataStore<Car>
    
    @State private var model: String = ""
    @State private var year: String = ""
    @State private var price: String = ""
    @State private var imageURL: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Car Model", text: $model)
                TextField("Year", text: $year)
                    .keyboardType(.numberPad)
                TextField("Price", text: $price)
                    .keyboardType(.decimalPad)
                TextField("Image URL", text: $imageURL)
                
                Button("Post Listing") {
                    if let yearInt = Int(year),
                       let priceDouble = Double(price) {
                        let car = Car(model: model,
                                      year: yearInt,
                                      price: priceDouble,
                                      imageURL: imageURL)
                        carStore.add(car)
                        model = ""; year = ""; price = ""; imageURL = ""
                    }
                }
                .buttonStyle(PillButtonStyle())
            }
            .navigationTitle("Sell a Car")
        }
    }
}




