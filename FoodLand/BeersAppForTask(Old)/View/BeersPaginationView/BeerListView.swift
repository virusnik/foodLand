//
//  BeerListView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/14/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

//struct BeerListView: View {
//    @EnvironmentObject private var viewModel: BeersViewModel
//    
//    var body: some View {
//        List(viewModel.items) { item in
//            VStack(alignment: .leading) {
//                BeersRow(item: item)
//                    .onAppear() {
//                        if self.viewModel.items.isLast(item) {
//                            self.viewModel.loadPage()
//                        }
//                }
//                NavPushButton(destination: BeerDetailsView(item: item)) {
//                    Text("push to details beer")
//                        .foregroundColor(.orange)
//                }
//            }
//            
//        }
//        .navigationBarTitle("Beers")
//        .onAppear() {
//            self.viewModel.loadPage()
//        }
//        .alert(isPresented: $viewModel.isNotConnected) {
//            Alert(title: Text("No connection"), message: Text("You are not connection to the internet."), dismissButton: .default(Text("OK")))
//        }
//    }
//}
//
//struct BeerList_Previews: PreviewProvider {
//    static var previews: some View {
//        BeerListView()
//    }
//}
