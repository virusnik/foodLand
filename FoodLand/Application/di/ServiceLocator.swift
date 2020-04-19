//
//  ServiceLocator.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/15/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

class ServiceLocator {
    
    var beerService: BeerServiceProtocol {
        return BeerService()
    }
    
}
