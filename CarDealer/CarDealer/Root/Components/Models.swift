//
//  Models.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/22/25.
//

import Foundation
import SwiftUI

struct Car: Identifiable, Codable {
    var id: UUID = UUID()
    var model: String
    var year: Int
    var price: Double
    var imageURL: String
}

struct Like: Identifiable, Codable {
    var id: UUID = UUID()
    var carId: UUID
}



