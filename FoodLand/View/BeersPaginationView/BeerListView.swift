//
//  BeerListView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/14/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct BeerListView: View {
    @EnvironmentObject private var viewModel: BeersViewModel
//    let locator = ServiceLocator()
    
    var body: some View {
        List(viewModel.items) { item in
            VStack(alignment: .leading) {
                BeersRow(item: item)
                    .onAppear() {
                        if self.viewModel.items.isLast(item) {
                            self.viewModel.loadPage()
                        }
                }
                NavPushButton(destination: BeerDetailsView(item: item)) {
                    Text("push to details beer")
                        .foregroundColor(.orange)
                }
            }
            
        }
        .navigationBarTitle("Beers")
        .onAppear() {
            self.viewModel.loadPage()
        }
    }
}

struct BeerList_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
