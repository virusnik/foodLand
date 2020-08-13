//
//  ShoppingCart.swift
//  FoodLand
//
//  Created by Sergio Veliz on 5/3/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ShoppingCart: View {
    init() {
        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
    }
    @EnvironmentObject var viewModel: CategoryListViewModel
    @State private var showDetails = false
    
    var body: some View {
        listView
    }
    
    var listView: AnyView {
        if viewModel.localFoodOrder.isEmpty {
            return AnyView(emptyListView)
        } else {
            return AnyView(cartListView)
        }
    }
    
    var emptyListView: some View {
        Text("Oops, looks like there's no products...\nYou can choose dishes on 'Menu'").multilineTextAlignment(.center)
    }
    
    var cartListView: some View {
        NavigationView {
            VStack{
                List {
                    Section {
                        ForEach(viewModel.localFoodOrder) { item in
                            ProductCard(item: item)
                        }
                    }
                    Section {
                        OrderInfoAdditionally(item: viewModel.orderInfo ?? OrderInfoAdditionallyModel(totalProductCost: viewModel.getTotalProductCost(), costOfService: viewModel.getCostOfService(), totalValue: viewModel.getTotalValue()))
                    }
                    if showDetails {
                         MessageView(title: "Your order successfully send to cook", message: "And you can just enjoy", style: .success)
                    }
                }
                .listStyle(GroupedListStyle())
                Button(action: {
                    self.showDetails.toggle()
                    
                }) { Text("BUY")
                    .fontWeight(.bold)
                    .font(.body)
                    .cornerRadius(5)
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 40, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                    )
                }
                
                Divider()
            }.onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
            })
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Cart")
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
