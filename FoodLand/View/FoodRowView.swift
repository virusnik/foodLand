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
//    var station: FoodRowViewModel
    @EnvironmentObject var viewModel: FoodRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(foodItem.foodName)
                    .font(.headline)
                
                Button(action: {
                    print("Delete tapped!")
                    self.viewModel.addToOrder(localFood: self.foodItem)
//                    FoodRowView.environmentObject(viewModel)
//                    self.station.addToOrder(localFood: self.foodItem)
                    }) {
                    Text("add")
                    .fontWeight(.bold)
                        .font(.body)
                    .background(Color.purple)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .padding(10)
                        .frame(width: 90, height: 20, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                }
                .padding(.trailing, 10)
                .frame( alignment: .trailing)
            }
            
            
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
