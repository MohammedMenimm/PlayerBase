import Foundation

struct TeamStanding: Codable, Identifiable {
    let id = UUID() // This remains for SwiftUI purposes, but it's outside of Codable handling
    let position: Int
    let team: TeamInfo
    let playedGames: Int
    let won: Int
    let drawn: Int? // Optional to handle missing data
    let lost: Int
    let points: Int
    let goalsFor: Int
    let goalsAgainst: Int
    let goalDifference: Int
    
    struct TeamInfo: Codable {
        let id: Int
        let name: String
        let shortName: String
        let tla: String
        let crest: String
    }
}
