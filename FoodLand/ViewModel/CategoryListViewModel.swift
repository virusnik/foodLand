//
//  CategoryListViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/2/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

final class CategoryListViewModel: ObservableObject {
    @Published private(set) var category = [CategoryListModel]()
    
    @Published private(set) var isLoading = false
    
    init() {
        loadfromServer()
    }
    
    func loadfromServer() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.category = [CategoryListModel(categoryName: "FastFood"),
            CategoryListModel(categoryName: "Food"),
            CategoryListModel(categoryName: "Snack"),
            CategoryListModel(categoryName: "Drinks"),
            CategoryListModel(categoryName: "Hookah"),]
            self.isLoading = false
        }
    }
}
