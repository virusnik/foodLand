//
//  ContentView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/2/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var categoryListViewModel: CategoryListViewModel
    @EnvironmentObject var beersListViewModel: BeersViewModel
    @State var selected: Int = 0
    @State var selectedItem: Int? = 0
    
    var tabsCount: CGFloat = 4
    var badgePosition: CGFloat = 3
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                TabView(selection: self.$selected) {
//                    ScannerView(selected: self.$selected, selectedItem: self.$selectedItem)
                                    ChooseTableView(numberTable: "",
                                                    selected: self.$selected,
                                                    selectedItem: self.$selectedItem)
                        .tag(0)
                        .tabItem {
                            VStack {
                                Text(Constants.TabBarTitle.main)
                                Image(systemName: Constants.TabBarImageName.main)
                            }
                    }
                    
                    MenuView(selectedItem: self.$selectedItem)
                        .tag(1)
                        .tabItem {
                            VStack {
                                Text(Constants.TabBarTitle.menu)
                                Image(systemName: Constants.TabBarImageName.menu)
                            }
                    }
                    
                    ShoppingCart(selected: self.$selected)
                        .tag(2)
                        .tabItem {
                            Text(Constants.TabBarTitle.cart)
                            Image(systemName: Constants.TabBarImageName.cart)
                    }
                    //            AboutView()
                    //                .tag(2)
                    //                .tabItem {
                    //                    Text(Constants.TabBarTitle.about)
                    //                    Image(systemName: Constants.TabBarImageName.about)
                    //            }
                    
                    HistoryView(selectedItem: self.$selectedItem)
                        .tag(3)
                        .tabItem {
                            Text(Constants.TabBarTitle.history)
                            Image(systemName: Constants.TabBarImageName.history)
                    }
                    
                }.accentColor(.black) // TabView
                ZStack {
                    Circle()
                        .foregroundColor(.red)
                    
                    Text("\(self.categoryListViewModel.countOfItemsOrdered)")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                    
                }
                .frame(width: 20, height: 20)
                .offset(x: ( ( 2 * self.badgePosition) - 1 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ), y: -30)
                .opacity(self.categoryListViewModel.countOfItemsOrdered == 0 ? 0 : 1)
            } // ZStack
        }// Geometry
        
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
