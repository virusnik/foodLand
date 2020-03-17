//
//  PunkView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/14/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct PunkView: View {
   @State private var selectorIndex = 0
    var title = ["Beer", "RandomBeer"]
//    var view = [BeerListView(), AboutView()] as [Any]

    var body: some View {
        VStack {
            Picker(selection: $selectorIndex, label: Text("")) {
                ForEach(0..<title.count) { index in
                    Text(self.title[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            if selectorIndex == 0 {
                NavControllerView(transition: .custom(.scale)) {
                    BeerListView()
                }
            } else {
                BeerRandomView()
            }
        }
    }
}

struct PunkView_Previews: PreviewProvider {
    static var previews: some View {
        PunkView()
    }
}
