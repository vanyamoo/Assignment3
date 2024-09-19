//
//  SetGame.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 13/09/2024.
//

import Foundation

struct SetGame {
    private(set) var deck: [Card]
    private(set) var selectedCards = [Card]()
    
    private(set) var cardsInPlay = [Card]()
    
    mutating func select(_ card: Card) {
        if card.isMatched == .yes {
            return
        }
        // 1. take action after a (matched/mismatched) Set
        if selectedCards.count == 3 {
            // 1. deselect non-matching cards or replace matching cards with new ones from the deck
            
            selectedCards.forEach { selectedCard in
                
                if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                    
                    if cardsMakeASet(selectedCards) { // (if cards are a match)
                        // deal 3 more cards in the place of the matched Set
                        if !deck.isEmpty {
                            
                            cardsInPlay[cardIndex] = deck.removeFirst()
                        } else {
                            cardsInPlay.remove(at: cardIndex)
                        }
                        
                    } else { // else if cards are a mismatch
                        
                        cardsInPlay[cardIndex].isMatched = .none
                    }
                }
            }
            
            // empty the selection
            selectedCards.removeAll()
        }
        
        // 2. building a new selection
        if selectedCards.count < 3 {
            
            // selecting/ deselecting
            if selectedCards.contains(card) {
                selectedCards.remove(card)
            } else {
                selectedCards.append(card)
                
                // marking a match/mismatch
                if selectedCards.count == 3 {
                    
                    selectedCards.forEach { selectedCard in
                        if let cardIndex = cardsInPlay.firstIndex(where: { $0.id == selectedCard.id } ) {
                            
                            // evaluating a selection
                            if cardsMakeASet(selectedCards) { // (cards are a match)
                                
                                // mark cards as matched
                                cardsInPlay[cardIndex].isMatched = .yes
                            } else { // cards are a mismatch
                                cardsInPlay[cardIndex].isMatched = .no
                            }
                        }
                    }
                    
                    
                }
            }
        } 

        print("selectedCards \(selectedCards)")
    }
    
    private func cardsMakeASet(_ cards: [Card]) -> Bool {
        true
    }
    
    private func deal3MoreCards() {
        
    }
    
    init(cardContentFactory: (Int, CardShape, CardShading, CardColor) -> CardContent) {
        // create the deck
        deck = [Card]()
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
