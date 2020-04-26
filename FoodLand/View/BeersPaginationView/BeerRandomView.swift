//
//  BeerRandomView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/17/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct BeerRandomView: View {
    
    @EnvironmentObject private var viewModel: BeersViewModel
    
    var body: some View {
        
        VStack() {
            Spacer()
            Text("\(self.viewModel.name ?? "ochakovo")")
            Spacer()
        }
        .onAppear() {
            self.viewModel.loadBeerRandom()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.viewModel.retrievedBeer()
            }
        }
        .navigationBarTitle(Text("Random Beer"))
        .alert(isPresented: $viewModel.isNotConnected) {
            Alert(title: Text("No connection"), message: Text("You are not connection to the internet."), dismissButton: .default(Text("OK")))
        }
        
    }
}

/*struct BeerRandomView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRandomView()
    }
} */
