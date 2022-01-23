//
//  PlayerImageView.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import SwiftUI

struct PlayerImageView: View {
    var size: CGFloat
    
    var body: some View {
        Image("profile.jpeg")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: size, height: size)
            .overlay(Circle().stroke(lineWidth: 3))
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct PlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        PlayerImageView(size: 250)
                .previewLayout(.sizeThatFits)
            
            PlayerImageView(size: 100)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
