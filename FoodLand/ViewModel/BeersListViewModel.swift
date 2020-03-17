//
//  BeersListViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/15/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

final class BeersListViewModel: ObservableObject {
    
    @Published private(set) var items: [BeersModelElement] = [BeersModelElement]()
    @Published private(set) var page: Int = 1
    @Published private(set) var isPageLoading: Bool = false
    
    func loadPage() {
        
        guard !self.isPageLoading else {
            return
        }
        self.isPageLoading = true
        self.page += 1
        
        NetworkManager().getBeersList(page: self.page) { (item, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                }
                if let item = item {
                    self.items.append(contentsOf: item)
                }
                self.isPageLoading = false
            }
        }
    }
    
    func loadBeerRandom() {
        DispatchQueue.main.async {
            self.isPageLoading = true
            
            NetworkManager().getBeerRandom() { (item, error) in
                if let error = error {
                    print(error)
                }
                if let item = item {
                    self.items.append(contentsOf: item)
                }
                self.isPageLoading = false
            }
        }
    }
    
}


