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
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ActivityIndicatorView()
            } else {
                List {
                    ForEach(0..<viewModel.category.count) { idx in
                        //Row
                        NavigationLink(destination: DishListView(Text("Coming soon: \(idx)")),
                                       tag: idx,
                                       selection: self.$selectedItem) {
                            Text(self.viewModel.category[idx].categoryName)
                        }
                    }
                .navigationBarTitle("Menu")
                } // NavigationView
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
