//
//  Sept24A3App.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 11/09/2024.
//

import SwiftUI

@main
struct Sept24A3App: App {
    var game = StandardSetGame()
    var body: some Scene {
        WindowGroup {
            StandardSetGameView(game: game)
        }
    }
}
