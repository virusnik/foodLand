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
    @State var isPresented: Bool = false
    var countOfItemsOrdered: Int?
    
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
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Menu")
            .navigationBarItems(trailing: Button(action: { self.isPresented.toggle() }) {
                GeometryReader { geometry in
                    Image(systemName: "cart")
                                    ZStack {
                                      Circle()
                                        .foregroundColor(.red)

                                        Text("\(10)") //
                                        .foregroundColor(.white)
                                        .font(Font.system(size: 12))
                                    }
                                    .frame(width: 15, height: 15)
                                    .offset(x: ( ( 2 * self.badgePosition) - 0.95 ) * ( geometry.size.width / ( 2 * self.navItemRightButton ) ) - 5, y: -12)
                                    .opacity(10 == 0 ? 0 : 1.0)
                }
                
            }).foregroundColor(.black)
            .sheet(isPresented: $isPresented) {
                ShoppingCart()
            }
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var selectedItem: Int? = 0
    static var previews: some View {
        MenuView(selectedItem: $selectedItem).environmentObject(CategoryListViewModel())
    }
}
