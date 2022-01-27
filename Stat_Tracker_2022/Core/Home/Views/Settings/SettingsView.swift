//
//  SettingsView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/27/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 40) {
            Button(role: .destructive) {
                LocalFileManager.instance.deleteImage(name: "profile")
                dismiss()
            } label: {
                Text("Delete Profile Image")
            }
            Button(role: .destructive) {
                LocalFileManager.instance.deleteGames()
                dismiss()
            } label: {
                Text("Delete Games Information")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
