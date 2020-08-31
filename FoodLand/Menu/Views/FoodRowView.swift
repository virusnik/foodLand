//
//  SwiftUIView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/12/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct FoodRowView: View {
    
    @State var foodItem: FoodListModel
    @State private var quantity: Int = 1
    @State private var totalPrice: Double?
    @State var isQuantity = false
    @EnvironmentObject var viewModelCategory: CategoryListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(foodItem.foodName)
                    .font(.headline)
                Spacer()
                Button(action: {
                    self.foodItem.quantity = self.quantity
                    self.viewModelCategory.addToOrder(localFood: self.foodItem)
                }) {
                    Text("add")
                        .fontWeight(.bold)
                        .font(.body)
                        .cornerRadius(5)
                        .foregroundColor(.black)
                        .padding(10)
                        .frame(width: 70, height: 20, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                    )
                } // Button
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
            Stepper(onIncrement: {
                self.quantity += 1
            }, onDecrement: {
                if self.quantity != 1 {
                    self.quantity -= 1
                }
            }, label: {
                Text("Number of: \(quantity)")
            })
        }.onAppear() {
        }
    }
}

//struct FoodRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodRowView()
//    }
//}
