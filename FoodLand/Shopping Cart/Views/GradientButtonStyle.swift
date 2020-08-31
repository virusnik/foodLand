//
//  GradientButtonStyle.swift
//  FoodLand
//
//  Created by Sergio Veliz on 8/31/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body)
            .foregroundColor(Color.white)
            .frame(width: UIScreen.main.bounds.width - 50, height: 40, alignment: .center)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .bottom, endPoint: .top))
            .cornerRadius(15.0)
    }
}
