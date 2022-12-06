import Foundation
import UIKit.UIImage

struct Category {
    var name: String
    var imageDefault: UIImage
    var imageSelected: UIImage
}

struct Store: Codable {
    var hotSales: [HotSalesItem]
    var bestSellers: [BestSeller]
    
    enum CodingKeys: String, CodingKey {
        case hotSales = "home_store"
        case bestSellers = "best_seller"
    }
}

struct HotSalesItem: Codable {
    var id: Int
    var isNew: Bool?
    var title: String
    var subtitle: String
    var pictureUrl: String
    var isBuy: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title, subtitle
        case isNew = "is_new"
        case pictureUrl = "picture"
        case isBuy = "is_buy"
    }
}

struct BestSeller: Codable {
    var id: Int
    var isFavorites: Bool
    var title: String
    var priceWithoutDiscount: Int
    var discountPrice: Int
    var pictureUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case isFavorites = "is_favorites"
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case pictureUrl = "picture"
    }
}
