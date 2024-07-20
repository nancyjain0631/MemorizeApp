    //
    //  ContentView.swift
    //  Memorize
    //
    //  Created by Nancy Jain on 20/07/24.
    //

import SwiftUI

struct ContentView: View {
    let emojiArray: [String] = ["😀", "👻", "😇", "🤪", "😞", "🥳", "💩", "😀", "👻", "😇", "🤪", "😞", "🥳", "💩"]
    @State var cardCount = 4
    var body: some View {
        ScrollView {
            cards
        }
        .foregroundColor(.orange)
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojiArray.count, id: \.self) { i in
                CardView(isFaceUp: true, emoji: emojiArray[i])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        
        
    }
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "plus")
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus")
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
            
        }) {
            Image(systemName: symbol)
                .font(.headline)
                .foregroundColor(.black)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojiArray.count)
    }
    
}

#Preview {
    ContentView()
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    fileprivate var rectangleShape = RoundedRectangle(cornerRadius: 12.0)
    fileprivate var emoji: String = ""
    var body: some View {
        ZStack {
            Group {
                rectangleShape.fill(.white)
                rectangleShape.strokeBorder(lineWidth: 2)
                Text(emoji)
                    .font(.largeTitle)
            }
            
            rectangleShape.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
        
    }
}
