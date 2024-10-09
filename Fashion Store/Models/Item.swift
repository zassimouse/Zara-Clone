//
//  Item.swift
//  Fashion Store
//
//  Created by Denis Haritonenko on 25.03.24.
//

import Foundation

struct Item {
    
    //    enum Sex {
    //        case male
    //        case female
    //        case kid
    //    }
    //    
    //    enum Category {
    //        case shirt
    //        case trousers
    //        case jeans
    //        case tshirt
    //        case shorts
    //        case poloshirt
    //        case jacket
    //        case coat
    //    }
    //    
    //    enum Color {
    //        case black
    //        case white
    //    }
    //    
    //    var id: String
    //    var title: String
    //    var price: String
    //    var imageURL: String
    //    var sex: Sex?
    //    var category: Category?
    //    var descriphiton: String?
    //    
    //    static func convertPriceToString() {
    //        
    //    }
    
    let id: String
    let title: String
    let price: Double
    let imageURL: String
    
    init?(id: String, dictionary: [String: Any]) {
        guard let title = dictionary["title"] as? String,
              let price = dictionary["price"] as? Double,
              let imageURL = dictionary["imageURL"] as? String
        else { return nil }
        self.id = id
        self.title = title
        self.price = price
        self.imageURL = imageURL
    }
    
    
}
