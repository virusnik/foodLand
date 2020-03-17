//
//  BeerListView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/14/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct BeerListView: View {
    @EnvironmentObject private var viewModel: BeersListViewModel

    var body: some View {
//        NavigationView {
            List(viewModel.items) { item in
                VStack(alignment: .leading) {
                    BeersRow(item: item).onTapGesture {
                        print("push to details")
//                        NavPushButton(destination: BeerDetailsView()) {
//                            Text("push to details")
//                        }
                    }
                    .onAppear() {
                        if self.viewModel.items.isLast(item) {
                            self.viewModel.loadPage()
                        }
                    }
                }

            }
            .navigationBarTitle("Beers")
            .onAppear() {
                self.viewModel.loadPage()
            }
//        }
    }
}

struct BeerList_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView()
    }
}
