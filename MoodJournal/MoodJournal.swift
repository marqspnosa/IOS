

import Foundation
import SwiftUI

class MoodJournal: ObservableObject {
    @Published var todayMood: MoodEntry?
    @Published var entries: [MoodEntry] = []

    func addMood(_ mood: Moods, note: String? = nil) {
        let entry = MoodEntry(mood: mood, date: Date(), note: note)
        todayMood = entry
        entries.insert(entry, at: 0)
    }
}

struct MoodEntry: Identifiable {
    let id = UUID()
    let mood: Moods
    let date: Date
    let note: String?
}
