//
//  GameLineItemView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct GameLineItemView: View {
    var game: Game
    
    var body: some View {
        HStack {
            VStack {
                if game.isFutsal {
                    Text("F")
                }
            }
            .frame(width: 20)
            VStack(alignment: .leading) {
                Text(game.opponent)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(Color.theme.accent)
                Text(game.dateOfGame.asString())
                    .foregroundColor(Color.theme.secondaryText)
            }
            Spacer()
            Text(game.gameResult)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
}

struct GameLineItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameLineItemView(game: dev.game)
                .previewLayout(.sizeThatFits)
            GameLineItemView(game: dev.game)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
