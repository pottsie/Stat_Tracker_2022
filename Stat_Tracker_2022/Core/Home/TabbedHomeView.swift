//
//  TabbedHomeView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct TabbedHomeView: View {
    @EnvironmentObject private var playerVM: PlayerProfileViewModel
    
    var body: some View {
        TabView {
            PlayerProfileView(player: playerVM.player)
                .tabItem {
                    Label("Player Profile", systemImage: "person.crop.square")
                }
            GameListView()
                .tabItem {
                    Label("Games", systemImage: "list.bullet")
                }
            Text("Stats")
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
        }
    }
}

struct TabbedHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedHomeView()
            .environmentObject(PlayerProfileViewModel())
    }
}
