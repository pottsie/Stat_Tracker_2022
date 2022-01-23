//
//  PreviewProvider.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    // Define example PlayerProfile and Game data below
}
