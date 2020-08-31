//
//  CategoryListModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/4/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

struct CategoryListModel: Identifiable {
    var id = UUID()
    var categoryName: String
    var foodListModel: [FoodListModel]
    var expanded = false
}
