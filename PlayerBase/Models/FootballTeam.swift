struct FootballTeam: Codable, Identifiable {
    let id: Int
    let name: String
    let shortName: String
    let tla: String
    let crest: String
    let address: String
    let website: String
    let founded: Int
    let clubColors: String? 
    let venue: String?
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case shortName
        case tla
        case crest
        case address
        case website
        case founded
        case clubColors
        case venue
        case lastUpdated
    }
}
