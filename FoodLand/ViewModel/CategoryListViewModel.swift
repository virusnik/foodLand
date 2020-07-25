//
//  CategoryListViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/2/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

final class CategoryListViewModel: ObservableObject {
    @Published var category = [CategoryListModel]()
    
    @Published private(set) var isLoading = false
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadfromServer() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.service.fetchMenu { (categoryList) in
                self.isLoading = false
                guard let category = categoryList else {
                    return
                }
                self.category = category
            }
//            self.category = [CategoryListModel(categoryName: "FastFood", foodListModel: [FoodListModel(foodImage: "image", foodName: "Burger Chicken", foodDescription: "Chicken burger, sauce, tomato", price: 200), FoodListModel(foodImage: "image", foodName: "Burger Beaf", foodDescription: "Fresh meat, sauce, onion, garlic", price: 220)]),
//                             CategoryListModel(categoryName: "Food", foodListModel: [FoodListModel(foodImage: "image", foodName: "Pasta", foodDescription: "makaron, pasta", price: 300), FoodListModel(foodImage: "image", foodName: "chicken wings", foodDescription: "sauce garlic, chiken", price: 330)]),
//                             CategoryListModel(categoryName: "Snack", foodListModel: [FoodListModel(foodImage: "image", foodName: "Snikers", foodDescription: "chocolate and arahis", price: 50), FoodListModel(foodImage: "image", foodName: "Bounty", foodDescription: "cocos, chocolate", price: 55)]),
//                             CategoryListModel(categoryName: "Drinks", foodListModel: [FoodListModel(foodImage: "image", foodName: "Wisky", foodDescription: "solod, alcohol", price: 150)]),
//                             CategoryListModel(categoryName: "Hookah", foodListModel: [FoodListModel(foodImage: "image", foodName: "DarkSide", foodDescription: "hight tabacoo", price: 400)]),]
            
        }
    }
}
