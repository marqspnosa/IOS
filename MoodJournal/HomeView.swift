

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var journal: MoodJournal
    @State private var selectedMood: Moods? = nil
    @State private var note: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Today's Mood")
                    .font(.largeTitle)

                if let entry = journal.todayMood {
                    Text(entry.mood.emoji)
                        .font(.system(size: 100))
                    Text(entry.mood.rawValue)
                        .foregroundColor(entry.mood.color)
                } else {
                    Text("")
                        .font(.system(size: 100))
                    Text("No mood selected")
                        .foregroundColor(.gray)
                
            }
                

                NavigationLink("Select Mood") {
                    MoodSelection(selectedMood: $selectedMood, note: $note)
                        .environmentObject(journal)  
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                NavigationLink("View Journal", destination: JournalView())
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
    }
}
