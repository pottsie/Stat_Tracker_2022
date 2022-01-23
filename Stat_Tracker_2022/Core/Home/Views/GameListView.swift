//
//  GameListView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(gameVM.filteredGameList()) { game in
                    GameLineItemView(game: game)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Label("Add game", systemImage: "plus.circle")
                    }
                }
            }
        }
    }
    
    var title: String {
        switch gameVM.filter {
        case .all:
            return "All Games"
        case .futsal:
            return "Futsal Games"
        case .outdoor:
            return "Outdoor Games"
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
            .environmentObject(GameViewModel())
    }
}

