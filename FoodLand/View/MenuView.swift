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
    @Binding var selectedItem: Int
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ActivityIndicatorView()
            } else {
                List {
//                    ForEach(viewModel.category) { category in
//                        NavigationLink(destination: DishListView(Text("Coming soon")), tag: 1, selection: self.$selectedItem) {
//                            Text("coming soon")
//                        }
//                    }
                    
                    ForEach(viewModel.category) { category in
                        //Row
                        NavigationLink(destination: DishListView(Text("Coming soon"))) {
                            Text(category.categoryName)
                        }
                    }
                .navigationBarTitle("Menu")
                } // NavigationView
            }
            
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var selectedItem = 1
    static var previews: some View {
        MenuView(selectedItem: $selectedItem)
    }
}
