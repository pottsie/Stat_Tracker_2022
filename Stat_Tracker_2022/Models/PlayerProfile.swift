//
//  PlayerProfile.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/23/22.
//

import Foundation

struct PlayerProfile: Identifiable, Codable {
    
    var id: String = "profile"
    var name: String
    var position: String
    var isGoalie: Bool
    var jerseyNumber: String
    var dateOfBirth: Date
    var ageGroup: String
    var team: String
    var email: String
    var cellPhone: String
    var twitter: String
    var instagram: String
    
    // initialize a default player, if there is no json data
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
        self.twitter = ""
        self.instagram = "myInstagram"
    }
    
    func json() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    init(url: URL) throws {
        let data = try Data(contentsOf: url)
        self = try PlayerProfile(json: data)
    }
    
    init(json: Data) throws {
        self = try JSONDecoder().decode(PlayerProfile.self, from: json)
    }
}
