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
    @State public var item: BeersModelElement
    
    
    var body: some View {
        VStack {
            ScrollView {
                ImageViewContainer(imageUrl: self.item.imageURL)
                Text("\(self.item.name ?? "Name")")
                    .font(.title)
                Text(("\(self.item.description ?? "Description")"))
                    .font(.body)
                    .padding(20)
                HStack {
                    NavPopButton(destination: .previous) {
                        Text("Pop to Previous")
                            .foregroundColor(.green)
                    }
                    .padding(10)
                    NavPushButton(destination: AboutView()) {
                        Text("Push to About App")
                            .foregroundColor(.blue)
                    }
                    .padding(10)
                } //HStack
                .padding(.bottom, 30)
                Spacer()
            } // ScrollView
        } // VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

/*struct ABeerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailsView()
    }
}
*/
