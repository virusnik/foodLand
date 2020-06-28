//
//  ShoppingCart.swift
//  FoodLand
//
//  Created by Sergio Veliz on 5/3/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ShoppingCart: View {
    var body: some View {
        NavigationView {
            List {
                Text("text")
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Cart")
//            .navigationBarItems(trailing: Button(action: {}) {
//                Image(systemName: "cart")
//            }).foregroundColor(.black)
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}

//struct ContentView: View {
//    
////    @EnvironmentObject var order: Order
//    @State private var badgeCount: Int = 1
//    private var badgePosition: CGFloat = 2
//    private var tabsCount: CGFloat = 3
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .bottomLeading) {
//            // TabView
//            TabView {
//              MenuView()
//                .tabItem {
//                  Image(systemName: "list.dash")
//                  Text("Menu")
//              }.tag(0)
//
//              OrderView()
//                .tabItem {
//                  Image(systemName: "cart")
//                  Text("Order")
//              }.tag(1)
//
//              Text("Favourite")
//                .tabItem {
//                  Image(systemName: "star")
//                  Text("Favourite")
//              }.tag(2)
//            }
//
//            // Badge View
//            ZStack {
//              Circle()
//                .foregroundColor(.red)
//
//                Text("\(self.order.items.count)")
//                .foregroundColor(.white)
//                .font(Font.system(size: 12))
//            }
//            .frame(width: 15, height: 15)
//            .offset(x: ( ( 2 * self.badgePosition) - 0.95 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ) + 2, y: -25)
//            .opacity(self.order.items.count == 0 ? 0 : 1.0)
//          }
//        }
//    }
//}
