//
//  CategoryListViewModelTests.swift
//  FoodLandTests
//
//  Created by Sergio Veliz on 7/19/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import XCTest
@testable import FoodLand

class CategoryListViewModelTests: XCTestCase {
    
    func testEmptyData() {
        let expectedList = [CategoryListModel]()
        let service = MockService(mockData: expectedList)
        
        let viewModel = CategoryListViewModel(service: service)
        
        viewModel.loadfromServer()
        XCTAssertTrue(viewModel.isLoading)
        
        XCTAssertEqual(viewModel.category.count, 0)
    }

}
