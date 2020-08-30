//
//  CategoryListViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/2/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation
import Disk

final class CategoryListViewModel: ObservableObject {
    
    @Published var category = [CategoryListModel]()
//    @Published var localFoodOrder = [FoodListModel]()
    var countOfItemsOrdered: Int = 0
    @Published private(set) var isLoading = false
    
//    @Published var foodItem: FoodListModel?
    @Published var orderInfoModel = OrderInfoAdditionallyModel()
    @Published var localOrdersModel = [OrderInfoAdditionallyModel]()
    
    private var documentDir: NSString!
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadfromServer() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
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
    
    func checkForProduct(_ searchItem: FoodListModel) -> Int {
        var targetIndex = -1
        
        if orderInfoModel.foodListModel.count > 0 {
            for index in 0...orderInfoModel.foodListModel.count - 1 {
                if orderInfoModel.foodListModel[index].id == searchItem.id && orderInfoModel.foodListModel[index].quantity == searchItem.quantity {
                    targetIndex = index
                }
            }
            
        }
        
        return targetIndex
    }
    
    func addToOrder(localFood: FoodListModel) {
            if checkForProduct(localFood) == -1 {
                do {
                    self.countOfItemsOrdered += localFood.quantity
                    orderInfoModel.foodListModel.append(localFood)
                    
                    try Disk.save(orderInfoModel.foodListModel, to: .documents, as: "foodToOrder.json")
                    
                    let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                    self.documentDir = dirPaths[0] as NSString
                    debugPrint("path : \(String(describing: self.documentDir))")
                    
                } catch let error as NSError {
                    fatalError("""
                        Code: \(error.code)
                        Description: \(error.localizedDescription)
                        """)
                }
                getHistoryOrder()
                debugPrint("Saved orders to disk")
            } 
            
        }
    
    func loadFromLocal() {
        if Disk.exists("foodToOrder.json", in: .documents) {
            retrievedFoodFromOrder()
        }
    }
    
    func retrievedFoodFromOrder() {
        if let retrievedItems = try? Disk.retrieve("foodToOrder.json", from: .documents, as: [FoodListModel].self) {
            
            for item in retrievedItems {
                self.countOfItemsOrdered += item.quantity
                orderInfoModel.foodListModel.append(item)
            }
            
            debugPrint("Retrieved food from disk")
        }
    }
    
    func deleteFromCart(index: IndexSet) {
        orderInfoModel.foodListModel.remove(atOffsets: index)
        getHistoryOrder()
        self.countOfItemsOrdered = 0
        for item in orderInfoModel.foodListModel {
            self.countOfItemsOrdered += item.quantity
        }
    }
    
    // Calculate only products cost
    func getTotalProductCost() -> Double {
        return orderInfoModel.foodListModel.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    // Calculate only cost of service
    func getCostOfService() -> Double {
        return orderInfoModel.foodListModel.reduce(0) { $0 + ($1.price * Double($1.quantity)) } / 100 * 10
    }
    
    // Calculate total value for order
    func getTotalValue() -> Double {
        return getTotalProductCost() + getCostOfService()
    }
    
    func getHistoryOrder() {
        orderInfoModel.totalProductCost = getTotalProductCost()
        orderInfoModel.costOfService = getCostOfService()
        orderInfoModel.totalValue = getTotalValue()
        orderInfoModel.quantity = countOfItemsOrdered
    }
    
    func getOrderHistory() {
        localOrdersModel.append(orderInfoModel)
    }
}
