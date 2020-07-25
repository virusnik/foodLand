//
//  AboutViewModel.swift
//  FoodLand
//
//  Created by Sergio Veliz on 6/28/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation

class AboutViewModel: ObservableObject {
  static var shared = AboutViewModel()

  @Setting(key: "TabSelection")
  var tabSelection: Int = 0
}
