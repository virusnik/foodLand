//
//  BeerRandomView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/17/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct BeerRandomView: View {
    
//    @State var isAbout: Bool = false
    @EnvironmentObject private var viewModel: BeerRandomViewModel
    
    var body: some View {
        
        VStack() {
            // What you care about displaying
            Spacer()
            Text("\(self.viewModel.name ?? "ochakovo")")
                .onAppear() {
                    self.viewModel.loadBeerRandom()
            }
            // This should be the last, put everything to the top
            Spacer()
        }
        .onAppear() {
            self.viewModel.loadBeerRandom()
        }
        .navigationBarTitle(Text("Random Beer"))
        
    }
}

/*struct BeerRandomView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRandomView()
    }
} */
