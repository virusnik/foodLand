//
//  FoodRowViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/22/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation
import Disk

final class FoodRowViewModel: ObservableObject {
    
    @Published var foodItem: FoodListModel?
    
    @Published var localFoodOrder = [FoodListModel]()
    private var documentDir: NSString!
//    public var quantity: Int = 1
    
    var totalPrice: Double = 0.0
    
    init() {}
    
    
    func checkForProduct(_ searchItem: FoodListModel) -> Int {
        var targetIndex = -1
        
        if localFoodOrder.count > 0 {
            for index in 0...localFoodOrder.count - 1 {
                if localFoodOrder[index].id == searchItem.id {
                    targetIndex = index
                }
            }
            
        }
        
        return targetIndex
    }
    
    func addToOrder(localFood: FoodListModel) {
        if checkForProduct(localFood) == -1 {
            do {
                
                try Disk.save(localFood, to: .documents, as: "foodToOrder.json")
                
                let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                self.documentDir = dirPaths[0] as NSString
                debugPrint("path : \(String(describing: self.documentDir))")
                
                localFoodOrder.append(localFood)
            } catch let error as NSError {
                fatalError("""
                    Code: \(error.code)
                    Description: \(error.localizedDescription)
                    """)
            }
            debugPrint("Saved beers to disk")
        }
        
    }
    
    func updateTotalPrice() {
        
        if let foodItem = self.foodItem {
//            totalPrice = foodItem.price * Double(quantity)
//            configureView(for: product, with: totalPrice)
        }
    }
}
