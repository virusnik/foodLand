//
//  BeerDetailsView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/17/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct BeerDetailsView: View {
    
    @State var isAbout: Bool = false
    
    var body: some View {
        VStack {
            NavPopButton(destination: .previous) {
                Text("Pop to Previous (1)")
            }
            NavPushButton(destination: AboutView()) {
                Text("Push to Screen №3")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
}

struct ABeerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailsView()
    }
}
