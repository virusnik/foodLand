//
//  ProductFromDetailsRow.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/30/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ProductFromDetailsRow: View {
    
    let item: FoodListModel
    @State var orderInfo: OrderInfoAdditionallyModel
    
    var dueDate = Date()
    
    var body: some View {
        VStack {
            HStack {
                Text("Name: \(item.foodName)")
                Spacer()
                Text("Quantity: \(item.quantity)")
            }
            
            HStack {
                Text("Status: \(item.getStatusText(item.dishStatus))")
                Spacer()
                Text("Cost: \(Int(item.price))")
            }
            
        }
        
    }
}

//struct ProductFromDetailsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductFromDetailsRow()
//    }
//}
