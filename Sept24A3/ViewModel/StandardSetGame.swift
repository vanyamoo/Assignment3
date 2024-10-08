//
//  StandardSetGame.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 13/09/2024.
//

import SwiftUI

@Observable class StandardSetGame {
    
    var cardsInPlay: [Card] {
        setGame.cardsInPlay
    }
    
    private(set) var setGame = createSetGame()
    
    private static func createSetGame() -> SetGame {
        SetGame { numShapes, shape, shading, color in
            CardContent(numOfShapes: numShapes, shading: shading, color: color, shape: shape)
        }
    }
    
    var isDeckEmpty: Bool { setGame.deck.isEmpty }
    
    func isCardSelected(_ card: Card) -> Bool {
        card.isIn(setGame.selectedCards)
    }
    
// MARK: - Intents
    
    func deal3MoreCards() {
        setGame.deal3MoreCards()
    }
    
    func newGame() {
        setGame = StandardSetGame.createSetGame()
    }
    
    func select(_ card: Card) {
        setGame.select(card)
    }
    
}

extension CardContent {
    func allSymbols() -> [Self] {
        var shapesArray = [Self]()
        for _ in 0..<self.numOfShapes {
            shapesArray.append(self)
        }
        return shapesArray
    }
}

extension CardColor {
    func applyColor() -> Color {
        switch self {
        case .red:
                .red
        case .purple:
                .purple
        case .green:
                .green
        }
    }
}

