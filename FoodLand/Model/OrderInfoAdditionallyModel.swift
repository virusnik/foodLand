//
//  OrderInfoAdditionallyModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/9/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation


struct OrderInfoAdditionallyModel: Codable, Identifiable {
    var id = UUID()
    var foodListModel: [FoodListModel]
    var totalProductCost: Double
    var costOfService: Double
    var totalValue: Double
    var quantity: Int
    var status: OrderStatus?
    
    init() {
        foodListModel = []
        totalProductCost = 0.0
        costOfService = 0.0
        totalValue = 0.0
        quantity = 0
        status = .open
    }

}

enum OrderStatus {
    case open
    case closed
    case cancelled
}

extension OrderStatus: Codable {
    private enum Key: CodingKey {
        case myValue
    }
    
    private enum CodingError: Error {
        case customError
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .myValue)
        switch rawValue {
        case 0:
            self = .open
        case 1:
            self = .closed
        case 2:
            self = .cancelled
        default:
            throw CodingError.customError
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .open:
            try container.encode(0, forKey: .myValue)
        case .closed:
            try container.encode(1, forKey: .myValue)
        case .cancelled:
            try container.encode(2, forKey: .myValue)
        }
    }
}
