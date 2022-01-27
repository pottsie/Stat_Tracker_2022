//
//  AddGame.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/26/22.
//

import SwiftUI

struct AddGame: View {
    @EnvironmentObject private var gameVM: GameViewModel
    @Environment(\.dismiss) var dismiss
    @State var newGame = Game()

    var body: some View {
        VStack {
            Text("Add New Game")
                .font(.largeTitle)
                .bold()
            Form {
                Section {
                    TextField(text: $newGame.opponent, prompt: Text("Opponent")) {
                        Text("Test")
                    }
                    DatePicker("Date of Game",
                               selection: $newGame.dateOfGame,
                               in: ...Date(),
                               displayedComponents: [.date])
                    Stepper(value: $newGame.ourScore, in: 0...25) {
                        HStack {
                            Text("Our Score")
                            Spacer()
                            Text("\(newGame.ourScore)")
                        }
                    }
                    Stepper(value: $newGame.opponentScore, in: 0...25) {
                        HStack {
                            Text("Opponent Score")
                            Spacer()
                            Text("\(newGame.opponentScore)")
                        }
                    }
                    Toggle("Futsal game?", isOn: $newGame.isFutsal)
                    TextEditor(text: $newGame.notes)
                        .frame(height: 100)
                } header: {
                    Text("Game Data")
                }
                Section {
                    Stepper(value: $newGame.statistics.minutesPlayed, in: 0...80) {
                        HStack {
                            Text("Minutes Played")
                            Spacer()
                            Text("\(newGame.statistics.minutesPlayed)")
                        }
                    }
                    Stepper(value: $newGame.statistics.goals, in: 0...newGame.ourScore) {
                        HStack {
                            Text("Goals")
                            Spacer()
                            Text("\(newGame.statistics.goals)")
                        }
                    }
                    Stepper(value: $newGame.statistics.assists, in: 0...(newGame.ourScore - newGame.statistics.goals)) {
                        HStack {
                            Text("Assists")
                            Spacer()
                            Text("\(newGame.statistics.assists)")
                        }
                    }
                    Stepper(value: $newGame.statistics.shots, in: 0...25) {
                        HStack {
                            Text("Shots")
                            Spacer()
                            Text("\(newGame.statistics.shots)")
                        }
                    }
                    Stepper(value: $newGame.statistics.shotsOnGoal, in: 0...newGame.statistics.shots) {
                        HStack {
                            Text("Shots on Goal")
                            Spacer()
                            Text("\(newGame.statistics.shotsOnGoal)")
                        }
                    }
                    Stepper(value: $newGame.statistics.passAttempts, in: 0...25) {
                        HStack {
                            Text("Pass Attempts")
                            Spacer()
                            Text("\(newGame.statistics.passAttempts)")
                        }
                    }
                    Stepper(value: $newGame.statistics.passCompletions, in: 0...newGame.statistics.passAttempts) {
                        HStack {
                            Text("Pass Completions")
                            Spacer()
                            Text("\(newGame.statistics.passCompletions)")
                        }
                    }
                    Stepper(value: $newGame.statistics.blocks, in: 0...25) {
                        HStack {
                            Text("Blocks")
                            Spacer()
                            Text("\(newGame.statistics.blocks)")
                        }
                    }
                    Stepper(value: $newGame.statistics.clearances, in: 0...25) {
                        HStack {
                            Text("Clearances")
                            Spacer()
                            Text("\(newGame.statistics.clearances)")
                        }
                    }
                    Stepper(value: $newGame.statistics.interceptions, in: 0...25) {
                        HStack {
                            Text("Interceptions")
                            Spacer()
                            Text("\(newGame.statistics.interceptions)")
                        }
                    }

                    
                } header: {
                    Text("Player Data")
                }
                Section {
                    Button {
                        gameVM.addGame(game: newGame)
                        dismiss()
                    } label: {
                        Text("Save Game")
                    }
                    Button(role: .destructive) {
                        dismiss()
                    } label: {
                        Text("Close and Discard Data")
                    }
                }
                
                
            }
        }
    }
}

struct AddGame_Previews: PreviewProvider {
    static var previews: some View {
        AddGame()
            .environmentObject(GameViewModel())
    }
}
