//
//  StandardSetGameOld.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 11/09/2024.
//

import SwiftUI

class StandardSetGameOld {
    
    typealias Card = SetGameOld.Card
    
    static let numTraits = ["1", "2", "3"]
    static let shadingTraits = ["open", "shaded", "solid"]
    static let colorTraits = ["red", "green", "purple"]
    static let shapeTraits = ["diamond", "rectangle", "capsule"]
    

    static let cardTraits = [numTraits, shadingTraits, colorTraits, shapeTraits]
    
    private(set) var setGame = createSetGame()
    private static func createSetGame() -> SetGameOld {
        SetGameOld(numOfShapes: numTraits, shadings: shadingTraits, colors: colorTraits, shapes: shapeTraits) { trait, traitNames  in
            switch trait {
            case .state0:
                return traitNames[0]
            case .state1:
                return traitNames[1]
            case .state2:
                return traitNames[2]
            }
        }
    }
    
//    private static func createSetGame() -> SetGameOld {
//        SetGameOld(numOfShapes: numTraits, shadings: shadingTraits, colors: colorTraits, shapes: shapeTraits) { trait, traitNames  in
//            switch trait {
//            case .state0:
//                return traitNames[0]
//            case .state1:
//                return traitNames[1]
//            case .state2:
//                return traitNames[2]
//            }
//        }
//    }
    
    var cards: [Card] {
        setGame.cards
    }
    

            
}

