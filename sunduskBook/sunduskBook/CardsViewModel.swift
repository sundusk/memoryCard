//
//  CardsViewModel.swift
//  sunduskBook
//
//  Created by IosDeveloper on 2024/7/16.
//

import SwiftUI
import Combine

class CardsViewModel: ObservableObject {
    @Published var cards: [Card] = []
    private let storageKey = "savedCards"

    init() {
        loadCards()
    }

    func addCard(title: String, content: String) {
        let newCard = Card(id: UUID(), title: title, content: content)
        cards.append(newCard)
        saveCards()
    }

    private func saveCards() {
        if let encoded = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    private func loadCards() {
        if let savedCardsData = UserDefaults.standard.data(forKey: storageKey),
           let savedCards = try? JSONDecoder().decode([Card].self, from: savedCardsData) {
            cards = savedCards
        }
    }
}
