//
//  SetGame.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 13/09/2024.
//

import Foundation

struct SetGame {
    private(set) var deck: [Card]
    
    /// The Array of cards currently selected by the user. Max 3 cards
    private(set) var selectedCards = [Card]()
    
    /// The Array of cards currently in play (displayed on screen)
    private(set) var cardsInPlay = [Card]()
    
    private var a3CardSet: Bool { selectedCards.count == 3 }
    
    /// Selects/deselects the card and plays a rounf of the game
    mutating func select(_ card: Card) {
        // do nothing if user selects a matched card
        if card.isMatched == .yes { return }
        
        // if 3 cards already selected
        if a3CardSet {
            clearSet()
        }
        // if less than 3 cards selected
        if selectedCards.count < 3 {
            selectDeselect(card)
            if a3CardSet {
                updateMatchedOrMismatchedStatus()
            }
        }

        print("selectedCards \(selectedCards)")
    }
    
    private mutating func clearSet() {
        if isAMatchedSet() { // matched
            replaceSet()
        } else { // mismatched
            deselectSelection()
        }
    }
    
    private mutating func selectDeselect(_ card: Card) {
        // if card already selected, deselect it
        if card.isIn(selectedCards) {
            selectedCards.remove(card)
        }
        //else add it to selection
        else {
            selectedCards.append(card)
        }
    }
    
    
    private mutating func updateMatchedOrMismatchedStatus() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                if isAMatchedSet() { // (cards are a match)
                    cardsInPlay[cardIndex].isMatched = .yes
                } else { // cards are a mismatch
                    cardsInPlay[cardIndex].isMatched = .no
                }
            }
        }
    }
    
    private func isAMatchedSet() -> Bool {
        true
    }
    
    /// Deselects the currently selected cards.
    private mutating func deselectSelection() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                cardsInPlay[cardIndex].isMatched = .none
            }
        }
        selectedCards.removeAll()
    }
    
    /// Removes the matched cards from the cards currently in play. Replaces them with a new set of card from the deck, if deck is not empty.
    private mutating func replaceSet() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                if !deck.isEmpty {
                    cardsInPlay[cardIndex] = deck.removeFirst()
                } else {
                    cardsInPlay.remove(at: cardIndex)
                }
            }
        }
        selectedCards.removeAll()
    }
    
    private func deal3MoreCards() {
        
    }
    
    init(cardContentFactory: (Int, CardShape, CardShading, CardColor) -> CardContent) {
        // create the deck
        deck = []
        for number in 1...3 {
            for shape in CardShape.allCases {
                for shading in CardShading.allCases {
                    for color in CardColor.allCases {
                        let content = cardContentFactory(number, shape, shading, color)
                        deck.append(Card(content: content, id: deck.count))
                    }
                }
            }
        }
        deck.shuffle()

        //deal initial 12 cards
        for index in 0..<12 {
            cardsInPlay.append(deck.remove(at: index))
        }
    }
}

struct Card: Identifiable, Equatable, CustomStringConvertible {
    let content: CardContent
    
    var isMatched: Matched = .none
    let id: Int
    
    var description: String {
        "\(id): \(content), isMatched(\(isMatched))"
    }
}

enum Matched: Equatable {
    case none
    case yes
    case no
}

extension Array where Element: Identifiable {
    mutating func remove(_ element: Element) {
        self.removeAll(where: { $0.id == element.id } )
    }
}

extension Card {
    func isIn(_ cards: [Card]) -> Bool {
        cards.contains(where: {$0.id == id})
    }
}
