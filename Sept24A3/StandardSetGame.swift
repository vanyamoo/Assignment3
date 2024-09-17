//
//  StandardSetGame.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 13/09/2024.
//

import SwiftUI

class StandardSetGame {
    
    private(set) var model = createSetGame()
    
    private static func createSetGame() -> SetGame {
        SetGame { numShapes, shape, shading, color in
            CardContent(numOfShapes: numShapes, shading: shading, color: color, shape: shape)
        }
        
    }
    
}
