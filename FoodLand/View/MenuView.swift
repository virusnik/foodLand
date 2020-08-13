//
//  MenuView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/2/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var viewModel: CategoryListViewModel
    @Binding var selectedItem: Int?
    var badgePosition: CGFloat = 2
    var navItemRightButton: CGFloat = 1
    @State var countOfItemsOrdered: Int = 0
    
    func sectionIndex(section : CategoryListModel) -> Int {
        viewModel.category.firstIndex(where: {$0.categoryName == section.categoryName})!
    }
    
    func foodIndex(section : Int, foodName : FoodListModel) -> Int {
        return viewModel.category[section].foodListModel.firstIndex(where: { $0.foodName == foodName.foodName })!
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.category) { section in
                    Section(header: HeaderView(section: section)
                        .onTapGesture {
                            self.viewModel.category[self.sectionIndex(section: section)].expanded.toggle()
                    }, footer: EmptyView()) {
                        if section.expanded {
                            ForEach(section.foodListModel) { foodItem in
                                FoodRowView(foodItem: foodItem)
                                    .environmentObject(self.viewModel)
                            }
                        }
                    }
                }
            }.onAppear {
                self.viewModel.loadfromServer()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Menu")

        }
        
    }
}

//struct MenuView_Previews: PreviewProvider {
//    @State static var selectedItem: Int? = 0
//    static var previews: some View {
//        MenuView(selectedItem: $selectedItem, foodItem: FoodListModel(from: <#Decoder#>)).environmentObject(CategoryListViewModel())
//    }
//}
