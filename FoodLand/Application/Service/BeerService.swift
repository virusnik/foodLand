//
//  BeerService.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/29/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

protocol BeerServiceProtocol {
    func fetchBeerList(page: Int, completion: @escaping (Result<[BeersModelElement], Error>) -> Void)
    func loadRandombeer(completion: @escaping (Result<[BeersModelElement], Error>) -> Void)
}

struct BeerService: BeerServiceProtocol {
    
    func loadRandombeer(completion: @escaping (Result<[BeersModelElement], Error>) -> Void) {
        NetworkManager().getBeerRandom { (beersModel, error) in
            guard let beers = beersModel else {
                completion(.failure(error as! Error))
                return
            }
            completion(.success(beers))
        }
    }
    
    func fetchBeerList(page: Int, completion: @escaping (Result<[BeersModelElement], Error>) -> Void) {
        NetworkManager().getBeersList(page: page) { (beersModel, error) in
            guard let beers = beersModel else {
                let errMessage = error ?? "Can't load beers list" as! Error
                let error = NSError(domain: "BeerService", code: 1, userInfo: [NSLocalizedDescriptionKey: errMessage])
                completion(.failure(error))
                return
            }
            completion(.success(beers))
        }
    }
    
}


