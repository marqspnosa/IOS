
import Foundation
import SwiftUI

struct MoodDetailView: View {
    let entry: MoodEntry

    var body: some View {
        VStack(spacing: 20) {
            Text(entry.mood.emoji)
                .font(.system(size: 100))

            Text(entry.mood.rawValue)
                .font(.largeTitle)
                .foregroundColor(entry.mood.color)

            Text("Date: \(entry.date.formatted(date: .long, time: .shortened))")
                

            if let note = entry.note {
                Text("Note:")
                Text(note)
            } else {
                Text("No notes")
                
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Mood Details")
    }
}
