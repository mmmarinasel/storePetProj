import Foundation

struct Cart: Codable {
    var basket: [Properties]
    var delivery: String
    var id: String
    var total: Int
}

struct Properties: Codable {
    var id: Int
    var imageUrl: String
    var price: Int
    var title: String
    enum CodingKeys: String, CodingKey {
        case id, price, title
        case imageUrl = "images"
    }
}
