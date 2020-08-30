//
//  HistoryView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/26/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    
    @Binding var selectedItem: Int?
    @EnvironmentObject var viewModel: CategoryListViewModel
    
    var body: some View {
        listView
    }
    
    var listView: AnyView {
        if viewModel.orderInfoModel.foodListModel.isEmpty {
            return AnyView(emptyListView)
        } else {
            return AnyView(historyListView)
        }
    }
    
    var emptyListView: some View {
        Text("Oops, looks like there's no orders receipts...\nYou can choose dishes on 'Menu' and than confirm your order").multilineTextAlignment(.center)
    }
    
    var historyListView: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: OrderDetailsView()) {
                        if viewModel.orderInfoModel.status == .open {
                            HistoryRowView(orderInfo: viewModel.orderInfoModel)
                        }
                        
                    }
                }
                
                Section(    ) {
                    if !viewModel.localOrdersModel.isEmpty {
                        ForEach(viewModel.localOrdersModel) { item in
                            if item.status == .closed {
                                HistoryRowView(orderInfo: item)
                            }
                            
                        }
                    }
                }
                
            }
            .navigationBarTitle("Orders Receipts")
        }.accentColor(.black)
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
