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
    Grid( viewModel.cards) { card in
      CardView(card: card).onTapGesture {
        viewModel.choose(card: card)
      }
    }
      .foregroundColor(Color.orange)
      .padding()
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  
  var body: some View {
    GeometryReader { geometry in
      renderCard(for: geometry.size)
    }
  }

  func renderCard(for size: CGSize) -> some View {
    ZStack {
      if card.isFaceUp {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
        RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: 3)
        Text(card.content)
      } else {
        RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
      }
    }
    .clipped()
    .font(Font.system(size: fontSize(for: size)))
    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
  }

  // MARK: - Drawing Constants
  let edgeLineWidth: CGFloat = 3
  let cornerRadius: CGFloat = 10.0
  func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.75
  }
}

//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    let game = EmojiMemoryGame()
//    EmojiMemoryGameView(viewModel: game)
//      .previewInterfaceOrientation(.portrait)
//  }
//}
