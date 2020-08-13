//
//  ScannerView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 6/11/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ScannerView: View {
    @ObservedObject var viewModel = ScannerViewModel()
    @Binding var selected: Int
    @Binding var selectedItem: Int?
    @State private var showDetails = false
    
    var body: some View {
        ZStack {
//            Text("Scanner goes here...")
            QrCodeScannerView()
            .found(r: self.viewModel.onFoundQrCode)
            .torchLight(isOn: self.viewModel.torchIsOn)
            .interval(delay: self.viewModel.scanInterval)
            
            VStack {
                VStack {
                    Text("Keep scanning for QR-codes")
                        .font(.subheadline)
                    if !self.viewModel.lastQrCode.isEmpty {
                        NavigationLink(destination: MainView(selected: selected)) {
                            Button("To menu", action: {
//                                self.showDetails.toggle()
                                self.selected = 1
                                self.selectedItem = Int(self.viewModel.lastQrCode)
                            })
                        }
                    }
                    Text(self.viewModel.lastQrCode)
                        .bold()
                        .lineLimit(5)
                        .padding()
                        .background(Color.white)
                }
                .padding(.vertical, 20)
                
                Spacer()
                HStack {
                    Button(action: {
                        self.viewModel.torchIsOn.toggle()
                    }, label: {
                        Image(systemName: self.viewModel.torchIsOn ? "bolt.fill" : "bolt.slash.fill")
                            .imageScale(.large)
                            .foregroundColor(self.viewModel.torchIsOn ? Color.yellow : Color.blue)
                            .padding()
                    })
                }
                .background(Color.white)
                .cornerRadius(10)
                
            }.padding()
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    @State static var selected = 1
    @State static var selectedItem:Int? = 1
    static var previews: some View {
        ScannerView(selected: $selected, selectedItem: $selectedItem)
    }
}
