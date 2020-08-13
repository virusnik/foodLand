//
//  OrderInfoAdditionallyModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/9/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

struct OrderInfoAdditionallyModel: Identifiable, Codable {
    var id = UUID()
    var totalProductCost: Double
    var costOfService: Double
    var totalValue: Double
}
