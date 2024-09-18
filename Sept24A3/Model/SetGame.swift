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
        if selectedCards.contains(card) {
            selectedCards.remove(card)
        } else {
            selectedCards.append(card)
        }
        print("selectedCards \(selectedCards)")
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
    
    var isMatched = false
    let id: Int
    
    var description: String {
        "\(id): \(content) \(isMatched ? " matched" : "")"
    }
}

extension Array where Element: Identifiable {
    mutating func remove(_ element: Element) {
        self.removeAll(where: { $0.id == element.id } )
    }
}
