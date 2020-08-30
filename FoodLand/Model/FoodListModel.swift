//
//  FoodListModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/5/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

struct FoodListModel: Identifiable, Codable {
    var id = UUID()
    var foodImage: String
    var foodName: String
    var foodDescription: String
    var price: Double
    var quantity: Int
    var waitingTime: Int
    var dishStatus: DishStatus
    
    func getStatusText(_ status: DishStatus) -> String {
        switch status {
        case .new:
            return "new"
        case .cooking:
            return "cooking"
        case .done:
            return "done"
        }
    }
}

enum DishStatus {
    case new
    case cooking
    case done
//    case payed
}

extension DishStatus: Codable {
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
            self = .new
        case 1:
            self = .cooking
        case 2:
            self = .done
//        case 3:
//            self = .payed
        default:
            throw CodingError.customError
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .new:
            try container.encode(0, forKey: .myValue)
        case .cooking:
            try container.encode(1, forKey: .myValue)
        case .done:
            try container.encode(2, forKey: .myValue)
//        case .payed:
//            try container.encode(2, forKey: .myValue)
        }
    }
}

//extension FoodListModel: Identifiable {
////    public var id: String {
////        self.foodName ?? UUID().uuidString
////    }
//    public
//}
