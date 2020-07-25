//
//  MockService.swift
//  FoodLandTests
//
//  Created by Sergio Veliz on 7/19/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

class MockService: ServiceProtocol {
    
    let mockData: [CategoryListModel]?
    
    init(mockData: [CategoryListModel]?) {
        self.mockData = mockData
    }
    
    func fetchMenu(completion: @escaping ([CategoryListModel]?) -> Void) {
        completion(mockData)
    }
    
}
