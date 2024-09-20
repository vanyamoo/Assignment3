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
        VStack {
            AspectVGrid(game.cardsInPlay, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .foregroundStyle(isSelected(card) ? .blue : .black)
                    .onTapGesture {
                        game.select(card)
                        isSelected.toggle()
                    }
            }
            
            HStack {
                Button("New Game", action: { game.newGame() })
                Spacer()
                Button("Deal 3 More Cards", action: { game.deal3MoreCards() } )
                .disabled(isDeckEmpty)
            }
            .padding()
        }
        
        
    }
    
    private var isDeckEmpty: Bool { game.setGame.deck.isEmpty }
    
    private func isSelected(_ card: Card) -> Bool {
        card.isIn(game.setGame.selectedCards)
    }
}

#Preview {
    StandardSetGameView(game: StandardSetGame())
}
