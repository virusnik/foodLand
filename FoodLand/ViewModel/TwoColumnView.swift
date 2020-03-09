//
//  TwoColumnView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/6/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct TwoColumnView: View {
    @EnvironmentObject var viewModel: FoodListViewModel
    @EnvironmentObject var listModel: CategoryListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    
                    ForEach(0..<viewModel.items.count, id: \.self) { pair in
                        // Row
                        HStack(spacing: 10) {
                            ForEach(self.viewModel.items[pair], id: \.self) {
                                number in
                                NavigationLink(destination: MenuView()
                                    .environmentObject(self.listModel)) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(.pink)
                                            Text("\(number)")
                                        }
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                } //NavigationLink
                            }
                        } // HStack
                    } // foreach
                } //VStack
            } // ScrollView
        } // NavigationView
        .padding(.horizontal, 20)
    }
}

struct TwoColumn_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnView().environmentObject(FoodListViewModel())
    }
}
