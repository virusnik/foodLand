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
    @State var selected = 0
    
    var body: some View {
        TabView(selection: $selected) {
            ChooseTableView(numberTable: "", selected: $selected, categoryListViewModel: _categoryListViewModel)
                .tag(0)
                .tabItem {
                    VStack {
                        Text(Constants.TabBarTitle.main)
                        Image(systemName: Constants.TabBarImageName.main)
                    }
            }
            
            MenuView()
                .environmentObject(categoryListViewModel)
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
            
            TwoColumnView()
                .environmentObject(categoryListViewModel)
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
