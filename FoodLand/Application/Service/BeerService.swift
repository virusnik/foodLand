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

class BeerService: BeerServiceProtocol {
    private let networkManager = NetworkManager()
    
    func loadRandombeer(completion: @escaping (Result<[BeersModelElement], Error>) -> Void) {
        networkManager.getBeerRandom { (beersModel, error) in
            guard let beers = beersModel else {
                let errorMessage = error ?? NSError(domain: "BeerRandomService", code: 1, userInfo: [NSLocalizedDescriptionKey: Constants.noConnection]) as! ResponseError
                completion(.failure(errorMessage))
                return
            }
            completion(.success(beers))
        }
    }
    
    func fetchBeerList(page: Int, completion: @escaping (Result<[BeersModelElement], Error>) -> Void) {
        networkManager.getBeersList(page: page) { (beersModel, error) in
            guard let beers = beersModel else {
                let errorMeesage = error ?? NSError(domain: "BeerService", code: 1, userInfo: [NSLocalizedDescriptionKey: Constants.noConnection]) as! ResponseError
                completion(.failure(errorMeesage))
                RealmData.shared.getRealmData { (beers: [BeersModelElement]) in completion(.success(beers)) }
                return
            }
            if beers.isEmpty {
                RealmData.shared.getRealmData { (beers: [BeersModelElement]) in completion(.success(beers)) }
            } else {
                RealmData.shared.writeData(beers)
                completion(.success(beers))
            }
            
        }
    }
    
}


