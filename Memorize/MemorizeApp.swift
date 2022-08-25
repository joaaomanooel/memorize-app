//
//  MemorizeApp.swift
//  Memorize
//
//  Created by João Neto on 22/08/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
  var body: some Scene {
    WindowGroup {
      let game = EmojiMemoryGame()
      EmojiMemoryGameView(viewModel: game)
    }
  }
}
