//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Polina Stelmakh on 25/02/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
