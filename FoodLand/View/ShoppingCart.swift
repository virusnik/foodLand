//
//  ShoppingCart.swift
//  FoodLand
//
//  Created by Sergio Veliz on 5/3/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ShoppingCart: View {
    @Binding var selected: Int
//    init() {
//        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
//    }
    @EnvironmentObject var viewModel: CategoryListViewModel
    @State private var showDetails = false
    @State private var showingAlert = false
    
    
    var body: some View {
        listView
    }
    
    var listView: AnyView {
        if viewModel.orderInfoModel.foodListModel.isEmpty || viewModel.orderInfoModel.status == .closed || viewModel.orderInfoModel.foodListModel.last?.dishStatus == .cooking {
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
                        ForEach(viewModel.orderInfoModel.foodListModel) { item in
                            if item.dishStatus == .new {
                                ProductCard(item: item)
                            }
                        }.onDelete(perform: self.delete)
                    }
                    Section {
                        OrderInfoAdditionally(item: viewModel.orderInfoModel)
                    }
                }
                .listStyle(GroupedListStyle())
                NavigationLink(destination: MainView(selected: selected)) {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showingAlert = true
                        }) {
                            HStack {
                                Image(systemName: "paperplane")
                                Text("Confirm order")
                            }
                        }.buttonStyle(GradientButtonStyle())
                        Spacer()
                    }
                } //NavigationLink
                
                Divider()
            }.onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
                self.viewModel.getHistoryOrder()
            })
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Cart")
            .alert(isPresented:$showingAlert) {
                Alert(title: Text("Are you sure you want to send to cook this?"), message: Text("There is no undo"), primaryButton: .default(Text("Yes")) {
                    // change status for order
                    self.viewModel.orderInfoModel.status = .open
                    // change status for every dishes
                    for index in self.viewModel.orderInfoModel.foodListModel.indices {
                        self.viewModel.orderInfoModel.foodListModel[index].dishStatus = .cooking
                    }
                    // nullify count dishes
                    self.viewModel.countOfItemsOrdered = 0
                    // navigate to HistoryView
                    self.selected = 3
                }, secondaryButton: .cancel())
            } // Alert message
        }
    }
    func delete(at offsets: IndexSet) {
        viewModel.deleteFromCart(index: offsets)
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body)
            .foregroundColor(Color.white)
            .frame(width: UIScreen.main.bounds.width - 50, height: 40, alignment: .center)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .bottom, endPoint: .top))
            .cornerRadius(15.0)
    }
}

//struct ShoppingCart_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingCart()
//    }
//}
