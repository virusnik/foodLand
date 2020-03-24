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
    @State var selectedItem: Int?
    
    var body: some View {
        TabView(selection: self.$selected) {
            ChooseTableView(numberTable: "",
                            selected: $selected,
                            selectedItem: $selectedItem)
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
            
            AboutView()
                .tag(2)
                .tabItem {
                    Text(Constants.TabBarTitle.about)
                    Image(systemName: Constants.TabBarImageName.about)
            }
            
            PunkView()
                .tag(3)
                .tabItem {
                    Text("Column")
                    Image(systemName: "hexagon")
            }
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
