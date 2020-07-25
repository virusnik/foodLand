//
//  MockFoodList.swift
//  FoodLandTests
//
//  Created by Sergio Veliz on 7/23/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

extension CategoryListModel {
    
    static func with(categoryName: String = "name") -> CategoryListModel {
        return CategoryListModel(categoryName: categoryName, foodListModel: [FoodListModel]())
    }
    
//    static func with(foodImage: String = "image",
//                     foodName: String = "garlic",
//                     foodDescription: String = "potatoes",
//                     price: Double = 230.0) -> FoodListModel {
//        return FoodListModel(foodImage: foodImage, foodName: foodName, foodDescription: foodDescription, price: price)
//    }
}
