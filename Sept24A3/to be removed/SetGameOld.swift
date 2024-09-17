//
//  StandardSetGameOld.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 11/09/2024.
//

import Foundation

struct SetGameOld {
    
    private(set) var cards: Array<Card>
    
    private func dealInitial12Cards() {
        
    }
    
    private func deal3NewCards() {
        
    }
    
    private var cardId = 0
    
//    init(cardTraits: [[String]], traitContentFactory: (Trait, [String]) -> String) {
//        cards = Array<Card>()
//        for trait in Trait.allCases {
//            for index in cardTraits.indices {
//                cards.append(Card(numOfShapes: traitContentFactory(trait, cardTraits[index]),
//                                  shading: traitContentFactory(trait, cardTraits[index]),
//                                  color: traitContentFactory(trait, cardTraits[index]),
//                                  shape: traitContentFactory(trait, cardTraits[index]),
//                                  id: cardId + 1))
//                cardId += 1
//            }
//        }
//        print(cards)
//    }

    
    init(numOfShapes: [String], shadings: [String], colors: [String], shapes: [String], traitContentFactory: (Trait, [String]) -> String) {
        cards = Array<Card>()
        for num in Trait.allCases {
            for shading in Trait.allCases {
                for color in Trait.allCases {
                    for shape in Trait.allCases {
                        cards.append(Card(numOfShapes: traitContentFactory(num, numOfShapes),
                                          shading: traitContentFactory(shading, shadings),
                                          color: traitContentFactory(color, colors),
                                          shape: traitContentFactory(shape, shapes),
                                          id: cardId + 1))
                        cardId += 1
                    }
                }
            }
        }
        print(cards)
    }
    
    
//    init(numTraits: [String], shadingTraits: [String], colorTraits: [String], shapeTraits: [String]) { 
//        cards = Array<Card>()
//        for numShapes in Trait.allCases {
//            for shading in Trait.allCases {
//                for color in Trait.allCases {
//                    for shape in Trait.allCases {
//                        cards.append(Card(numOfShapes: numShapes.name(numTraits),
//                                          shading: shading.name(shadingTraits),
//                                          color: color.name(colorTraits),
//                                          shape: shape.name(shapeTraits),
//                                          id: cardId + 1))
//                        cardId += 1
//                    }
//                }
//            }
//        }
//        print(cards)
//    }
    
    struct Card: Identifiable, CustomStringConvertible {
        let numOfShapes: String
        let shading: String
        let color: String
        let shape: String
        //let content: CardContent
        
        var isMatched = false
        
        let id: Int
        
        var description: String {
            "\(id): \(numOfShapes) \(shading) \(color) \(shape) \(isMatched ? " matched" : "")"
        }
        
//        struct CardContent {
//            let numOfShapes: String
//            let shading: String
//            let color: String
//            let shape: String
//        }
    }
 
}

enum Trait: CaseIterable {
    case state0
    case state1
    case state2
    
    
//    func name(_ traitNames: [String]) -> String {
//        switch self {
//        case .state0:
//            return traitNames[0]
//        case .state1:
//            return traitNames[1]
//        case .state2:
//            return traitNames[2]
//        }
//    }
}


