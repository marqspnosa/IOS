//
//  DataStore.swift
//  CarDealer
//
//  Created by Nancy Ty Espinosa on 9/22/25.
//

import Foundation

class DataStore<T: Codable & Identifiable>: ObservableObject where T.ID == UUID {
    @Published var items: [T] = []
    private let storageKey: String
    
    init(storageKey: String) {
        self.storageKey = storageKey
        load()
    }
    
    func add(_ item: T) {
        items.append(item)
        save()
    }
    
    func remove(id: UUID) {
        items.removeAll { $0.id == id }
        save()
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([T].self, from: data) {
            self.items = decoded
        }
    }
}

