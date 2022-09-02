//
//  SplashScreenView.swift
//  Memorize
//
//  Created by João Neto on 02/09/22.
//

import SwiftUI

struct SplashScreenView: View {
  @State private var IsActive = false
  @State private var size = 0.8
  @State private var opacity = 0.5


  func renderEmojiMemoryGame() -> some View {
    let game = EmojiMemoryGame()
    return EmojiMemoryGameView(viewModel: game)
  }

  func renderSplashScreen() -> some View {
    VStack {
      VStack {
        Image(systemName: "hare.fill").font(.system(size: 80)).foregroundColor(.orange)
        Text("Memorize").font(.system(size: 26)).bold().foregroundColor(.black.opacity(0.8))
      }
      .scaleEffect(size)
      .opacity(opacity)
      .onAppear {
        withAnimation(.easeIn(duration: 1.2)) {
          size = 0.9
          opacity = 1.0
        }
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        IsActive = true
      }
    }
  }

  var body: some View {
    if IsActive {
      renderEmojiMemoryGame()
    } else {
      renderSplashScreen()
    }

  }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
