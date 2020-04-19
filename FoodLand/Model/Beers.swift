//
//  Beers.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/16/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

struct BeersModelElement: Codable {
    let name: String?
    let description: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case imageURL = "image_url"
    }
}



//extension BeersModelElement: Decodable {
//    
//    enum BeersCodingKeys: String, CodingKey {
//        case name
//        case description
//        case imageURL = "image_url"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let beerContainer = try decoder.container(keyedBy: BeersCodingKeys.self)
//        name = try beerContainer.decode(String.self, forKey: .name)
//        description = try beerContainer.decode(String.self, forKey: .description)
//        imageURL = try beerContainer.decode(String.self, forKey: .imageURL)
//    }
//    
//}

extension BeersModelElement: Identifiable {
    public var id: String {
        self.name ?? UUID().uuidString
    }
}
