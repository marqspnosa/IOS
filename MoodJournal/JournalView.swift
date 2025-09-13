

import Foundation
import SwiftUI

struct JournalView: View {
    @EnvironmentObject var journal: MoodJournal

    var body: some View {
        List(journal.entries) { entry in
            NavigationLink(destination: MoodDetailView(entry: entry)) {
                HStack {
                    Text(entry.mood.emoji)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text(entry.mood.rawValue)
                            .font(.headline)
                        Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle("Mood Journal")
    }
}
