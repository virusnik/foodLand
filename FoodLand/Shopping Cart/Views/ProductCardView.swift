//
//  ProductCardView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/3/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ProductCard: View {
    
    let item: FoodListModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Main Featured Image - Upper Half of Card
            Image("logo_placeholder_food")
                .resizable()
                .scaledToFill()
                .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 150, alignment: .center)
                .clipped()
                .overlay(
                    Text("juicy burger".uppercased())
                        .fontWeight(Font.Weight.medium)
                        .font(Font.system(size: 16))
                        .foregroundColor(Color.white)
                        .padding([.leading, .trailing], 16)
                        .padding([.top, .bottom], 8)
                        .background(Color.black.opacity(0.5))
                        .mask(RoundedCorners(tl: 0, tr: 0, bl: 0, br: 15))
                    , alignment: .topLeading)
            // Stack bottom half of card
            VStack(alignment: .leading, spacing: 6) {
                Text(self.item.foodName)
                    .fontWeight(Font.Weight.heavy)
                Text("approximate waiting time ~ \(item.waitingTime) m")
                    .font(Font.custom("HelveticaNeue-Bold", size: 16))
                    .foregroundColor(Color.gray)
                // Horizontal Line separating details and price
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: nil, height: 1, alignment: .center)
                    .padding([.leading, .trailing], -12)
                
                // Price and Buy Now Stack
                HStack(alignment: .center, spacing: 4) {
                    Text(String.init(format: "$%.2f", arguments: [self.item.price]))
                        .fontWeight(Font.Weight.heavy)
                    Text("servings: \(self.item.quantity)")
                        .font(Font.system(size: 13))
                        .fontWeight(Font.Weight.bold)
                        .foregroundColor(Color.gray)
                }.padding([.top, .bottom], 8)
                
            }
            .padding(12)
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
    }
}

