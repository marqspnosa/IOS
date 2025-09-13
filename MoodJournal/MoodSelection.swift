

import SwiftUI

struct MoodSelection: View {
    @Binding var selectedMood: Moods?
    @Binding var note: String
    @EnvironmentObject var journal: MoodJournal
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("How are you feeling?")
                .font(.largeTitle)

            ForEach(Moods.allCases) { mood in
                Button(action: {
                    selectedMood = mood
                }) {
                    HStack {
                        Text(mood.emoji)
                            .font(.system(size: 50))
                        Text(mood.rawValue)
                            .font(.title2)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(mood == selectedMood ? mood.color.opacity(0.6) : Color.gray.opacity(0.2))
                    .cornerRadius(12)
                }
            }

            TextField("Optional note...", text: $note)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top)

            Spacer()

            Button(action: {
                if let mood = selectedMood {
                    journal.addMood(mood, note: note)  
                    dismiss()
                }
            }) {
                Text("Save Mood")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedMood == nil ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(selectedMood == nil)
        }
        .padding()
    }
}
