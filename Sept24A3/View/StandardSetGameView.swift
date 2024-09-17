//
//  StandardSetGameView.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 11/09/2024.
//

import SwiftUI

struct StandardSetGameView: View {
    var game: StandardSetGame
    
    var body: some View {
        AspectVGrid(game.cards, aspectRatio: 2/3) { card in
            CardView(card: card)
        }
    }
}

#Preview {
    StandardSetGameView(game: StandardSetGame())
}
