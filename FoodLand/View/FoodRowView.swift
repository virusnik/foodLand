//
//  SwiftUIView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/12/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct FoodRowView: View {
    
    var foodItem: FoodListModel
    @State private var count: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(foodItem.foodName)
                .font(.headline)
            
            Text(foodItem.foodDescription)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(2)
                .font(.callout)
                .foregroundColor(.gray)
            
            Text(String(foodItem.price))
                .font(.footnote)
            
            Stepper(value: $count, in: 0...100,label:  {
                Text("Number of: \(count)")
            })
            
        }
    }
}

//struct FoodRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodRowView()
//    }
//}
