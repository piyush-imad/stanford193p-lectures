//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Piyush Sharma on 28/02/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
