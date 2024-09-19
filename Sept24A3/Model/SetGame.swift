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
    
    /// Selects/deselects the card and plays a rounf of the game
    mutating func select(_ card: Card) {
        
        // 0. do nothing if user selects a matched card
        if card.isMatched == .yes { return }
        
        // 1. if we have a (matched/mismatched) Set of 3 cards already
        if selectedCards.count == 3 {
            if isASet() { // if matched
                replaceSet()
            } else { // mismatched
                deselectSelection()
            }
            selectedCards.removeAll()
        }
        
        // 2.
        if selectedCards.count < 3 {
            selectDeselectCard(card)
            if selectedCards.count == 3 {
                markCardsAsMatchedOrMismatched()
            }
        }

        print("selectedCards \(selectedCards)")
    }
    
    private mutating func selectDeselectCard(_ card: Card) {
        if selectedCards.contains(card) {
            selectedCards.remove(card)
        } else {
            selectedCards.append(card)
        }
    }
    
    
    private mutating func markCardsAsMatchedOrMismatched() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                if isASet() { // (cards are a match)
                    cardsInPlay[cardIndex].isMatched = .yes
                } else { // cards are a mismatch
                    cardsInPlay[cardIndex].isMatched = .no
                }
            }
        }
    }
    
    private func isASet() -> Bool {
        true
    }
    
    /// Deselects the currently selected cards.
    private mutating func deselectSelection() {
        selectedCards.forEach { selectedCard in
            if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                cardsInPlay[cardIndex].isMatched = .none
            }
        }
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
