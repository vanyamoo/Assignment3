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
        AspectVGrid(game.setGame.cards, aspectRatio: 2/3) { card in
            CardView(card: card)
        }
        
    }
}

struct CardView: View {
    let card: SetGame.Card
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .stroke()
            Text(card.description)
                .foregroundStyle(.black)
        }
        
    }
}

#Preview {
    StandardSetGameView(game: StandardSetGame())
}
