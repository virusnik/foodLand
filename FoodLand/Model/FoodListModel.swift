//
//  FoodListModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/5/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

struct FoodListModel: Identifiable {
    var id = UUID()
    var foodImage: String
    var foodName: String
    var foodDescription: String
    var price: Double
}
