//
//  StandardSetGameView.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 11/09/2024.
//

import SwiftUI

struct StandardSetGameView: View {
    var game: StandardSetGame
    
    @State private var isSelected = false
    var body: some View {
        AspectVGrid(game.cards, aspectRatio: 2/3) { card in
            CardView(card: card)
                .foregroundStyle(isSelected(card) ? .blue : .black)
                .onTapGesture {
                    game.select(card)
                    isSelected.toggle()
                }
        }
    }
    
    private func isSelected(_ card: Card) -> Bool {
        game.setGame.selectedCards.contains(card)
    }
}

#Preview {
    StandardSetGameView(game: StandardSetGame())
}
