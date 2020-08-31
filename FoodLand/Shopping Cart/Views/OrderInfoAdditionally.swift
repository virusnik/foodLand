//
//  OrderInfoAdditionally.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/9/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct OrderInfoAdditionally: View {
    
    let item: OrderInfoAdditionallyModel
    
    var body: some View {
        VStack {
            Text("Product cost: \(Int(item.totalProductCost))").frame(maxWidth: .infinity, alignment: .trailing)
            Text("Cost of service: \(Int(item.costOfService))").frame(maxWidth: .infinity, alignment: .trailing)
            Text("Total value: \(Int(item.totalValue))").frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

//struct OrderInfoAdditionally_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderInfoAdditionally()
//    }
//}
