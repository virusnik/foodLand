//
//  ServiceLocator.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/15/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

class ServiceLocator {
    
    private lazy var services: [String: Any] = [:]
    
    static var shared = ServiceLocator()
    
    func register<T>(_ service: T) {
        let key = "\(type(of: T.self))"
        services[key] = service
    }
    
    func instance<T>() -> T? {
        let key = "\(type(of: T.self))"
        return services[key] as? T
    }
    
}

extension ServiceLocator {
    func registerDefaultServices() {
        register(BeerService() as BeerServiceProtocol)
    }
}
