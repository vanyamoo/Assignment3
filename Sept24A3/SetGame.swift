//
//  StandardSetGame.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 11/09/2024.
//

import Foundation

struct SetGame {
    
    private(set) var cards: Array<Card>
    
    private func dealInitial12Cards() {
        
    }
    
    private func deal3NewCards() {
        
    }
    
    private var cardId = 0
    
    init() {
        cards = Array<Card>()
        for numShapes in Trait.allCases {
                for shadingTrait in Trait.allCases {
                    for colorTrait in Trait.allCases {
                        for shapeTrait in Trait.allCases {
                        cards.append(Card(numOfShapes: numShapes, shading: shadingTrait, color: colorTrait, shape: shapeTrait, id: cardId + 1))
                        cardId += 1
                    }
                }
            }
        }
        print(cards)
    }
    
    struct Card: Identifiable, CustomStringConvertible {
        let numOfShapes: Trait
        let shading: Trait
        let color: Trait
        let shape: Trait
        
        var isSelected = false
        var isMatched = false
        
        let id: Int
        
        var description: String {
            "\(id): \(numOfShapes) \(shading) \(color) \(shape) \(isSelected ? "selected" : "") \(isMatched ? " matched" : "")"
        }
        
//        struct CardContent {
//            let color: Trait
//            let shape: Trait
//            let shading: Trait
//            let numOfShapes: Trait
//        }
    }
    
    enum Trait: CaseIterable {
    case state1
    case state2
    case state3
    }
    
}
