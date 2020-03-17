//
//  BeerRandomViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/17/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

final class BeerRandomViewModel: ObservableObject {
    @Published private(set) var items: [BeersModelElement] = [BeersModelElement]()
    @Published private(set) var isPageLoading: Bool = false
    @Published var name: String?
    
    func loadBeerRandom() {
//        DispatchQueue.main.async {
            self.isPageLoading = true
            
            NetworkManager().getBeerRandom() { (item, error) in
                DispatchQueue.main.async {
                if let error = error {
                    print(error)
                }
                if let item = item {
                    self.name = item[0].name
                    self.items.append(contentsOf: item)
                }
                self.isPageLoading = false
            }
        }
//        }
    }
}
