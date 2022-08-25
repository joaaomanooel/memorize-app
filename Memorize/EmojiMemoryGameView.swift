//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by João Neto on 22/08/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel: EmojiMemoryGame

  var body: some View {
    HStack {
      ForEach(viewModel.cards) { card in
        CardView(card: card).onTapGesture {
          viewModel.choose(card: card)
        }
      }
    }
      .foregroundColor(Color.orange)
      .font(Font.largeTitle)
      .padding()
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card

  var body: some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
        Text(card.content)
      } else {
        RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
      }
    }.clipped().shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    EmojiMemoryGameView(viewModel: game)
      .previewInterfaceOrientation(.portrait)
  }
}
