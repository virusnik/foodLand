//
//  ExtensionsRandomAccsess.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/15/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

extension String: Identifiable {
    public var id: String {
        self
    }
    
    func convertToSecondsInt() -> Int {
        let components: Array = self.components(separatedBy: ":")
        let hours = Int(components[0]) ?? 0
        let minutes = Int(components[1]) ?? 0
        return (hours * 3600) + (minutes * 60)
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLast(_ item: Element)->Bool {
        guard isEmpty == false else {
            return false
        }
        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) })  else {
            return false
        }
        return distance(from: itemIndex, to: endIndex) == 1
    }
}
