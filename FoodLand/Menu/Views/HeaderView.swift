//
//  HeaderView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 4/12/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var section : CategoryListModel
    @EnvironmentObject var viewModel: CategoryListViewModel
    
    var body: some View {
        HStack() {
            Spacer()
            Text(section.categoryName)
                .font(.title)
                .foregroundColor(Color.white)
            Spacer()
        }.background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .bottom, endPoint: .top))
        .cornerRadius(5.0)
    }
}
