//
//  AddGameView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct AddGameView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    @Environment(\.dismiss) var dismiss
    @State var opponent: String = ""
    @State var ourScore: Int = 0
    @State var opponentScore: Int = 0
    @State var dateOfGame: Date = Date()
    @State var isFutsal: Bool = false
    @State var notes: String = "Notes about the game."
    @State var minutesPlayed: Int = 0
    @State var goals: Int = 0
    @State var assists: Int = 0
    @State var shots: Int = 0
    @State var shotsOnGoal: Int = 0
    @State var passAttempts: Int = 0
    @State var passCompletions: Int = 0
    @State var blocks: Int = 0
    @State var interceptions: Int = 0
    @State var clearances: Int = 0

    
    var body: some View {
        
        VStack {
            Text("Add New Game")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.theme.accent)
            ScrollView {
                
                Text("Game Data".uppercased())
                    .bold()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.3))
                
            gameInfo
            
                Text("Player Data".uppercased())
                    .bold()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.3))

            offensiveStats
            
            defensiveStats
            
            TextEditor(text: $notes)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .border(Color.theme.secondaryText)
            }
            HStack {
                Spacer()
                Button {
//                    gameVM.addGame(opponent: opponent, dateOfGames: dateOfGame, ourScore: ourScore, opponentScore: opponentScore, isFutsal: isFutsal, notes: notes, stats: Statistics(minutesPlayed: minutesPlayed, goals: goals, assists: assists, shots: shots, shotsOnGoal: shotsOnGoal, passAtt: passAttempts, passComp: passCompletions, blocks: blocks, clearances: clearances, interceptions: interceptions))
                    dismiss()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 120, height: 40)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Cancel".uppercased())
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 120, height: 40)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct AddGameView_Previews: PreviewProvider {
    static var previews: some View {
        AddGameView()
            .environmentObject(GameViewModel())
    }
}

extension AddGameView {
    var gameInfo: some View {
        VStack {
            HStack {
                Text("Opponent: ")
                    .foregroundColor(Color.theme.secondaryText)
                Spacer()
                TextField("Opponent", text: $opponent)
                    .foregroundColor(Color.theme.accent)
            }
            DatePicker("Date of Game",
                       selection: $dateOfGame,
                       in: ...Date(),
                       displayedComponents: [.date]
            )
            Toggle(isOn: $isFutsal) {
                Text("Futsal game?")
            }
            Stepper(value: $ourScore, in: 0...15) {
                HStack {
                    Text("Our score:")
                    Spacer()
                    Text("\(ourScore)")
                }
            }
            Stepper(value: $opponentScore, in: 0...15) {
                HStack {
                    Text("Opponent score:")
                    Spacer()
                    Text("\(opponentScore)")
                }
            }
        }
    }
    
    var offensiveStats: some View {
        VStack {
            HStack {
                Text("Minutes played: ")
                Spacer()
                TextField("Minutes", value: $minutesPlayed, format: .number)
                    .keyboardType(.numberPad)
            }
            Stepper(value: $goals, in: 0...ourScore) {
                HStack {
                    Text("Goals:")
                    Spacer()
                    Text("\(goals)")
                }
            }
            Stepper(value: $assists, in: 0...ourScore) {
                HStack {
                    Text("Assists:")
                    Spacer()
                    Text("\(assists)")
                }
            }
            Stepper(value: $shots, in: 0...25) {
                HStack {
                    Text("Shots:")
                    Spacer()
                    Text("\(shots)")
                }
            }
            Stepper(value: $shotsOnGoal, in: 0...shots) {
                HStack {
                    Text("Shots on goal:")
                    Spacer()
                    Text("\(shotsOnGoal)")
                }
            }
            Stepper(value: $passAttempts, in: 0...25) {
                HStack {
                    Text("Pass attempts:")
                    Spacer()
                    Text("\(passAttempts)")
                }
            }
            Stepper(value: $passCompletions, in: 0...passAttempts) {
                HStack {
                    Text("Pass completions:")
                    Spacer()
                    Text("\(passCompletions)")
                }
            }
        }
    }
    
    var defensiveStats: some View {
        VStack {
            Stepper(value: $blocks, in: 0...25) {
                HStack {
                    Text("Blocks:")
                    Spacer()
                    Text("\(blocks)")
                }
            }
            Stepper(value: $interceptions, in: 0...25) {
                HStack {
                    Text("Interceptions:")
                    Spacer()
                    Text("\(interceptions)")
                }
            }
            Stepper(value: $clearances, in: 0...25) {
                HStack {
                    Text("Clearances:")
                    Spacer()
                    Text("\(clearances)")
                }
            }
        }
    }
}
