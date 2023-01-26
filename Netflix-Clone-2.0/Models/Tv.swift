import Foundation

struct TrendingTvResponse: Codable {
    // Match the names of the attributes from JSON file
    let results: [Tv]
    
}

struct Tv: Codable {
    // Copy (from JSON) all the attibutes that define a Tv
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
