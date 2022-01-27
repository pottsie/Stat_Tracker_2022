//
//  GameDetailScreen.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/25/22.
//

import SwiftUI

struct GameDetailScreen: View {
    @EnvironmentObject private var playerVM: PlayerProfileViewModel
    var game: Game
    
    var body: some View {
        VStack(spacing: 25) {
            header
                .padding(.top, 10)
            
            gameInformation
            
            playingTime
            
            // Refactor offensive, passing, defensive data into a function call
            offensiveData
            
            passingData
            
            defensiveData
            
            gameNotes
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
                } label: {
                    Label("Edit game", systemImage: "pencil")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
                } label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                }

            }
        }
    }
}

struct GameDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        GameDetailScreen(game: dev.game)
            .environmentObject(PlayerProfileViewModel())
        }
    }
}

extension GameDetailScreen {
    
    var header: some View {
        HStack(spacing: 0) {
            Spacer()
            PlayerImageView(size: 100)
            
            VStack(alignment: .leading) {
                Text(playerVM.player.name)
                    .font(.title)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.heavy)
                Text(playerVM.player.position)
                    .italic()
                Text(playerVM.player.team)
                    .italic()
                Text(playerVM.player.ageGroup)
                    .italic()
            }
            .font(.headline)
            .foregroundColor(Color.theme.secondaryText)
            .frame(width: 225, alignment: .leading)
            Spacer()
        }
    }
    
    var gameInformation: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Opponent".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text(game.opponent)
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Result".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text(game.gameResult)
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
        }
        .padding(.horizontal)
    }
    
    var playingTime: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Minutes Played".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.minutesPlayed)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    var offensiveData: some View {
        HStack(alignment: .bottom) {
            VStack {
                Text("Goals".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.goals)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
            Spacer()
            VStack {
                Text("Assists".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.assists)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
            Spacer()
            VStack {
                Text("Shots on Goal".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.shotsOnGoal)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110, alignment: .trailing)
        }
        .padding(.horizontal)
    }
    
    var passingData: some View {
        HStack(alignment: .bottom) {
            VStack {
                Text("Pass Att".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.passAttempts)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
            Spacer()
            VStack {
                Text("Pass Comp".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.passCompletions)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
            Spacer()
            VStack {
                Text("Pass %".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.passPercentage.asPercentString())")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
        }
        .padding(.horizontal)
    }

    var defensiveData: some View {
        HStack(alignment: .bottom) {
            VStack {
                Text("Blocks".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.blocks)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
            Spacer()
            VStack {
                Text("Clearances".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.clearances)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
            Spacer()
            VStack {
                Text("Interceptions".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text("\(game.statistics.interceptions)")
                    .font(.title3)
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.black)
            }
            .frame(width: 110)
        }
        .padding(.horizontal)
    }
    
    var gameNotes: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Game Notes".uppercased())
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text("Solid defensive game.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(5)
                .frame(height: 100, alignment: .topLeading)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.gray.opacity(0.2))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

    }

}
