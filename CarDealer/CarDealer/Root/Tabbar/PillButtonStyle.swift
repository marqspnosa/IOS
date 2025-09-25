//
//  PillButtonStyle.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/25/25.
//

import SwiftUI

struct PillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(
                Capsule()
                    .fill(Color.blue)
            )
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

