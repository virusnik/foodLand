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
}

extension BeersModelElement: Identifiable {
    public var id: String {
        self.name ?? UUID().uuidString
    }
}
