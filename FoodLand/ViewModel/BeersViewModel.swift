//
//  BeersViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/15/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

final class BeersViewModel: ObservableObject {
    
    @Published private(set) var items: [BeersModelElement] = [BeersModelElement]()
    @Published private(set) var page: Int = 1
    @Published private(set) var isPageLoading: Bool = false
    @Published var name: String?
    
    let service = BeerServiceLocator()
    
    func loadPage() {
        
        guard !self.isPageLoading else {
            return
        }
        self.isPageLoading = true
        self.page += 1
        
        service.fetchBeerList(page: self.page) { (result) in
            DispatchQueue.main.async {
                
                switch result {
                case .success(let beers):
                    self.items = beers
                case .failure(let error):
                    print(error)
                }
                
                self.isPageLoading = false
            }
            
        }
        
    }
    
    func loadBeerRandom() {
        self.isPageLoading = true
        
        service.loadRandombeer { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let beers):
                    self.items = beers
                    self.name = beers[0].name
                case .failure(let error):
                    print(error)
                }
                self.isPageLoading = false
            }
        }
    }
    
}


