//
//  APIService.swift
//  FoodLand
//
//  Created by Sergio Veliz on 7/25/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

class APIService : ServiceProtocol {
    
    var category = [CategoryListModel]()
    
    func fetchMenu(completion: @escaping ([CategoryListModel]?) -> Void) {
        self.category = [CategoryListModel(categoryName: "FastFood", foodListModel: [FoodListModel(foodImage: "image", foodName: "Burger Chicken", foodDescription: "Chicken burger, sauce, tomato", price: 200, quantity: 1, waitingTime: 15), FoodListModel(foodImage: "image", foodName: "Burger Beaf", foodDescription: "Fresh meat, sauce, onion, garlic", price: 220, quantity: 1, waitingTime: 15)]),
                         CategoryListModel(categoryName: "Food", foodListModel: [FoodListModel(foodImage: "image", foodName: "Pasta", foodDescription: "makaron, pasta", price: 300, quantity: 1, waitingTime: 18), FoodListModel(foodImage: "image", foodName: "chicken wings", foodDescription: "sauce garlic, chiken", price: 330, quantity: 1, waitingTime: 20)]),
                         CategoryListModel(categoryName: "Snack", foodListModel: [FoodListModel(foodImage: "image", foodName: "Snikers", foodDescription: "chocolate and arahis", price: 50, quantity: 1, waitingTime: 2), FoodListModel(foodImage: "image", foodName: "Bounty", foodDescription: "cocos, chocolate", price: 55, quantity: 1, waitingTime: 2)]),
                         CategoryListModel(categoryName: "Drinks", foodListModel: [FoodListModel(foodImage: "image", foodName: "Wisky", foodDescription: "solod, alcohol", price: 150, quantity: 1, waitingTime: 5)]),
                         CategoryListModel(categoryName: "Hookah", foodListModel: [FoodListModel(foodImage: "image", foodName: "DarkSide", foodDescription: "hight tabacoo", price: 400, quantity: 1, waitingTime: 20)]),]
        
        completion(category)
    }
    
    
    
    
}
