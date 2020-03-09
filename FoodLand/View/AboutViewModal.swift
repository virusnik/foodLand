//
//  AboutViewModal.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/5/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct AboutViewModal: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            Text("Coming soon")
                .navigationBarItems(trailing: Button(action: { self.presentationMode.wrappedValue.dismiss() } ) {
                    Text("Close")
                })
        } // NavigationView
    }
}

struct AboutViewModal_Previews: PreviewProvider {
    static var previews: some View {
        AboutViewModal()
    }
}
