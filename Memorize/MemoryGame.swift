//
//  MemoryGame.swift
//  Memorize
//
//  Created by João Neto on 23/08/22.
//

import Foundation

struct MemoryGame<CardContent> {
  var cards: Array<Card>

  mutating func choose(card: Card) {
    print("card chosen: \(card)")
    let chosenIndex: Int = index(of: card)
    cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
  }

  func index(of card: Card) -> Int {
    for index in 0..<cards.count {
      if cards[index].id == card.id {
        return index
      }
    }
    return 0 // TODO: bogus
  }

  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
    cards = Array<Card>()

    for pairIndex in 0..<numberOfPairsOfCards{
      let content = cardContentFactory(pairIndex)

      cards.append(Card(content: content, id: pairIndex * 2))
      cards.append(Card(content: content, id: pairIndex * 2 + 1))
    }
  }

  struct Card: Identifiable {
    var isFaceUp: Bool = false
    var isMatch: Bool = false
    var content: CardContent
    var id: Int
  }
}
