

import Foundation
import SwiftUI

enum Moods: String, CaseIterable, Identifiable {
    case happy = "Happy"
    case sad = "Sad"
    case angry = "Angry"
    case neutral = "Neutral"

    var id: String { self.rawValue }

    var color: Color {
        switch self {
        case .happy: return .green
        case .sad: return .yellow
        case .angry: return .red
        case .neutral: return .gray
        }
    }

    var emoji: String {
        switch self {
        case .happy: return "😊"
        case .sad: return "😢"
        case .angry: return "😡"
        case .neutral: return "😐"
        }
    }
}
