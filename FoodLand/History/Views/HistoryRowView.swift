//
//  HistoryRowView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/26/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct HistoryRowView: View {
    
    @State var orderInfo: OrderInfoAdditionallyModel
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var dueDate = Date()
    
    var body: some View {
        VStack {
            HStack {
                Text("# order: \(orderInfo.id)")
                    .font(.system(size: 10))
                Spacer()
                Text("Quantity: \(orderInfo.quantity)")
            }
            
            HStack {
                Text("\(dueDate, formatter: Self.taskDateFormat)")
                Spacer()
                Text("Total Sum: \(Int(orderInfo.totalValue))")
            }
            
        }
        
    }
}

//struct HistoryRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryRowView()
//    }
//}
