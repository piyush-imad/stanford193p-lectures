//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Piyush Sharma on 28/02/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
