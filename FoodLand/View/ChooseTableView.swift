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
    @EnvironmentObject var categoryListViewModel: CategoryListViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Choose your table")
                TextField("Enter number table", text: $numberTable)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationLink(destination: MainView(selected: selected)) {
                    Button("To menu") {
                        self.selected = 1
                    }
                } //NavigationLink
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
    static var previews: some View {
        ChooseTableView(selected: $selected)
    }
}
