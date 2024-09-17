//
//  SetGame.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 13/09/2024.
//

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var selectedCards = Array<Card>()
    
    private func dealInitial12Cards() {
        
    }
    
    private func deal3NewCards() {
        
    }
    
    init(cardContentFactory: (Int, CardShape, CardShading, CardColor) -> CardContent) {
        deck = Array<Card>()
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
    }
}

struct Card: Identifiable, CustomStringConvertible {
    let content: CardContent
    
    var isMatched = false
    let id: Int
    
    var description: String {
        "\(id): \(content) \(isMatched ? " matched" : "")"
    }
}
