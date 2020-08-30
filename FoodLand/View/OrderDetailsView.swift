//
//  OrderDetailsView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/30/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct OrderDetailsView: View {
    
    @EnvironmentObject var viewModel: CategoryListViewModel
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        ForEach(viewModel.orderInfoModel.foodListModel) { item in
                            if item.dishStatus == .cooking || item.dishStatus == .done {
                                ProductFromDetailsRow(item: item, orderInfo: self.viewModel.orderInfoModel)
                            }
                        }
                    } // Section dish
                    Section {
                        OrderInfoAdditionally(item: viewModel.orderInfoModel)
                    } // Section money
                }.listStyle(GroupedListStyle()) // List
                    .navigationBarTitle("Details Order Receipt")
                HStack {
                    Spacer()
                    Button(action: {
                        self.showingAlert = true
                    }) {
                        HStack {
                            Text("Pay The Bill")
                        }
                    }.buttonStyle(GradientButtonStyle())
                    Spacer()
                } // Button payment
            }
            .alert(isPresented:$showingAlert) {
                Alert(title: Text("Are you want to pay for this order?"), message: Text("There is no undo"), primaryButton: .default(Text("Yes")) {
                    self.viewModel.orderInfoModel.status = .closed
                    self.viewModel.getOrderHistory()
                    }, secondaryButton: .cancel())
            } // show alert when user want pay
        }.accentColor( .black)
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView()
    }
}
