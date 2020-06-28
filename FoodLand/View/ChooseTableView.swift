//
//  ChooseTableView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/5/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ChooseTableView: View {
    
    @State var numberTable: String = ""
    @Binding var selected: Int
    @Binding var selectedItem: Int?
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Choose your table")
                TextField("Enter number table", text: $numberTable)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                NavigationLink(destination: MainView(selected: selected)) {
                    Button("To menu") {
                        
//                        self.selected = 1
//                        self.selectedItem = Int(self.numberTable)
                    }
//                } //NavigationLink
            }
            .navigationBarTitle("Welcome")
            // VStack
        } // NavigationView
            .padding()
            .font(.title)
    }
    
}

struct ChooseTableView_Previews: PreviewProvider {
    @State static var selected = 1
    @State static var selectedItem:Int? = 1
    static var previews: some View {
        ChooseTableView(selected: $selected, selectedItem: $selectedItem)
    }
}
