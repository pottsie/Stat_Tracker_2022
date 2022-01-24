//
//  PlayerProfile.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

struct PlayerProfile: Identifiable {
    
    let id: String = "profile"
    var name: String
    var position: String
    var isGoalie: Bool
    var jerseyNumber: String
    var dateOfBirth: Date
    var ageGroup: String
    var team: String
    var email: String?
    var cellPhone: String?
    var twitter: String?
    var instagram: String?
    
    init() {
        self.name = "Full Name"
        self.position = "Position"
        self.isGoalie = false
        self.jerseyNumber = "00"
        self.dateOfBirth = Date("1966-09-20")
        self.ageGroup = "U-18"
        self.team = "Team Name"
        self.email = "myemail@domain.com"
        self.cellPhone = "000-000-0000"
        self.twitter = nil
        self.instagram = "myInstagram"
    }
    
//    init(name: String, position: String, isGoalie: Bool, jerseyNumber: String, dateOfBirth: Date = Date("2010-01-05"), ageGroup: String, team: String, email: String?, cellPhone: String?, twitter: String?, instagram: String?) {
//        self.name = name
//        self.position = position
//        self.isGoalie = isGoalie
//        self.jerseyNumber = jerseyNumber
//        self.dateOfBirth = dateOfBirth
//        self.ageGroup = ageGroup
//        self.team = team
//        self.email = email
//        self.cellPhone = cellPhone
//        self.twitter = twitter
//        self.instagram = instagram
//    }
    
}
