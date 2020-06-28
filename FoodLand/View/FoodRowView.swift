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
    @State private var quantity: Int = 1
    @State private var totalPrice: Double?
    @State var isQuantity = false
//    var station: FoodRowViewModel
    @EnvironmentObject var viewModel: FoodRowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(foodItem.foodName)
                    .font(.headline)
                Spacer()
                Button(action: {
                    print("Delete tapped!")
                    self.viewModel.addToOrder(localFood: self.foodItem)
//                    FoodRowView.environmentObject(viewModel)
//                    self.station.addToOrder(localFood: self.foodItem)
                    }) {
                    Text("add")
                    .fontWeight(.bold)
                        .font(.body)
//                    .background(Color.black)
                    .cornerRadius(5)
                    .foregroundColor(.black)
                    .padding(10)
                        .frame(width: 70, height: 20, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
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
//            ("Number", value: $totalPrice, formatter: DoubleFormatter())
//            Text(isQuantity ? "\(totalPrice)" : "\(foodItem.price)")
                .font(.footnote)
            
            Stepper(onIncrement: {
//                viewModel.updateTotalPrice()
                self.quantity += 1
                self.totalPrice = self.foodItem.price * Double(self.quantity)
            }, onDecrement: {
                self.quantity -= 1
            }, label: {
                Text("Number of: \(quantity)")
            })
//            Stepper(value: $quantity, in: 1...100,label:  {
//                Text("Number of: \(quantity)")
////                self.up
////                self.totalPrice =  foodItem.price * Double(quantity)
////                viewModel.updateTotalPrice()
//            })
            
            
            
        }.onAppear() {
            func updateTotalPrice()  {
                    
                if let foodItem = self.viewModel.foodItem {
                    self.totalPrice =  foodItem.price * Double(self.quantity)
            //            totalPrice = foodItem.price * Double(quantity)
            //            configureView(for: product, with: totalPrice)
                    }
                }
//            self.viewModel.updateTotalPrice()
        }
    }
}

//struct FoodRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodRowView()
//    }
//}
