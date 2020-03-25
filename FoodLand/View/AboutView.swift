//
//  AboutView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/2/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    @State var isAbout: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
            }, label: {
                Text("Tappped for more information about us")
                    .simultaneousGesture(TapGesture().onEnded {
                        self.isAbout.toggle()
                    })
            }) // Button
            NavPopButton(destination: .root) {
                Text("Pop to Root")
                    .foregroundColor(.green)
                    .padding(.top, 20)
            } // NavPopButton
            Spacer()
        } //VStack
        .sheet(isPresented: $isAbout, onDismiss: {
            print("Close Modal")
        }) {
            AboutViewModal()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
