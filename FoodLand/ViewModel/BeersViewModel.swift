//
//  BeersViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/15/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation
import Disk

final class BeersViewModel: ObservableObject {
    
    @Published private(set) var items: [BeersModelElement] = [BeersModelElement]()
    @Published private(set) var page: Int = 1
    @Published private(set) var isPageLoading: Bool = false
    @Published var name: String?
    
    private var documentDir: NSString!
    
    let service = BeerService()
    
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
        
        if Disk.exists("beers.json", in: .documents) {
            retrievedBeer()
        } else {
            service.loadRandombeer { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let beers):
                        do {
                            try Disk.save(beers, to: .documents, as: "beers.json")
                            
                            let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                            self.documentDir = dirPaths[0] as NSString
                            debugPrint("path : \(String(describing: self.documentDir))")
                        } catch let error as NSError {
                            fatalError("""
                                Code: \(error.code)
                                Description: \(error.localizedDescription)
                                """)
                        }
                        debugPrint("Saved beers to disk")
                    case .failure(let error):
                        print(error)
                    }
                    self.isPageLoading = false
                }
            }
        }
        
        
    }
    
    func retrievedBeer() {
        if let retrievedBeers = try? Disk.retrieve("beers.json", from: .documents, as: [BeersModelElement].self) {
            
            var result: String = ""
            for item in retrievedBeers {
                result.append("\(item.name ?? String())\n\n\(item.description ?? String())")
            }
            self.name = result
            debugPrint("Retrieved beers from disk")
        }
    }
    
}


