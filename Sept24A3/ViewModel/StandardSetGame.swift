//
//  StandardSetGame.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 13/09/2024.
//

import SwiftUI

class StandardSetGame {
    
    var cards: [Card] {
        setGame.deck
    }
    
    private(set) var setGame = createSetGame()
    
    private static func createSetGame() -> SetGame {
        SetGame { numShapes, shape, shading, color in
            CardContent(numOfShapes: numShapes, shading: shading, color: color, shape: shape)
        }
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

