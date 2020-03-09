//
//  FoodListViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/5/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

final class FoodListViewModel: ObservableObject {
    @Published private(set) var foodList = [FoodListModel(foodName: "Burger Chicken"),
                                            FoodListModel(foodName: "Burger Beef"),
                                            FoodListModel(foodName: "Burger Chicken Hot"),
                                            FoodListModel(foodName: "Burger Beef Hot")]
    
    @Published private(set) var items = [[Int]]()
    
    init() {
        let columned = (1...20).publisher.collect(2)
        _ = columned.collect().sink {
            self.items = $0
            print($0)
        }
    }
}
