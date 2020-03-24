//
//  BeersRow.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/17/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct BeersRow: View {

    @EnvironmentObject var viewModel: BeersViewModel
    
    let item: BeersModelElement
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name ?? "")
                .font(.headline)
            Text(item.description ?? "")
                .font(.callout)
                .foregroundColor(.gray)
            
            if self.viewModel.isPageLoading && self.viewModel.items.isLast(item) {
                Divider()
                Text("Loading...")
            }
        }
    }
}
