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
    
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ActivityIndicatorView()
            } else {
                List {
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
    static var previews: some View {
        MenuView().environmentObject(CategoryListViewModel())
    }
}
