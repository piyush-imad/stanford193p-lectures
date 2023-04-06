//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Piyush Sharma on 28/02/23.
//
// imperative coding vs declarative coding
import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var emojis = ["✈️","🚗","🚀","🚘","🚙","🚎","🚛","🛫","🚕","🚚"]
    @State var emojiCount = 4
    var body: some View {

            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                if card.isMatched && !card.isFaceUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card).padding(4)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red )

    }
}

struct CardView: View {
    var card: EmojiMemoryGame.Card
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius:DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: -90),
                        endAngle: Angle(degrees: 20))
                        .padding(DrawingConstants.circlePadding)
                        .opacity(DrawingConstants.circleOpacity)
                    Text(card.content).font(font(in: geometry.size))
                } else if (card.isMatched) {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 5
        static let fontScale: CGFloat = 0.65
        static let circlePadding: CGFloat = 7
        static let circleOpacity: CGFloat = 0.5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
