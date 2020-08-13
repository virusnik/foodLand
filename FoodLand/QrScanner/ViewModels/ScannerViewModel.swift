//
//  ScannerViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 6/11/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

class ScannerViewModel: ObservableObject {
    let scanInterval: Double = 1.0
    
    @Published var torchIsOn: Bool = false
    @Published var lastQrCode: String = ""
    
    func onFoundQrCode(_ code: String) {
        self.lastQrCode = code
    }
}
