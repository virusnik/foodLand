//
//  BeerService.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/29/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

protocol BeerServiceLocatorProtocol {
    func makeRequest(page: Int, completion: (Result<[BeersModelElement], Error>) -> Void)
}

struct BeerServiceLocator: BeerServiceLocatorProtocol {
    func makeRequest(page: Int, completion: (Result<[BeersModelElement], Error>) -> Void) {
        NetworkManager().getBeersList(page: page) { (item, error) in
            completion(item, error)
        }
    }
    
}


