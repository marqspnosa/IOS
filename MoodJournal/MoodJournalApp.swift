

import SwiftUI

@main
struct MoodJournalApp: App {
    @StateObject var journal = MoodJournal()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(journal)
        }
    }
}
