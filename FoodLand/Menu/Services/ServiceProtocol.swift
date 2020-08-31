//
//  ServiceProtocol.swift
//  FoodLand
//
//  Created by Sergio Veliz on 7/23/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func fetchMenu(completion: @escaping ([CategoryListModel]?) -> Void)
}
