//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JoÃ£o Neto on 23/08/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
  @Published private var memoryGame: MemoryGame<String> = createMemoryGame()

  static func createMemoryGame() -> MemoryGame<String> {
    let emojis: Array<String> = ["ð»", "ð¨ð½âð¾", "ð¥°", "ð³"]
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in emojis[pairIndex] }
  }

  // MARK: - Access to the Model
  var cards: Array<MemoryGame<String>.Card> {
    memoryGame.cards
  }

  // MARK: - Intent(s)
  func choose(card: MemoryGame<String>.Card) {
    memoryGame.choose(card: card)
  }

}
