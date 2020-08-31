//
//  NavControllerView.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/17/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct NavControllerView<Content>: View where Content: View{
    
    @ObservedObject private var viewModel: NavControllerViewModel
    
    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: NavTransition,
         easing: Animation = .easeOut(duration: 0.33),
         @ViewBuilder content: @escaping () -> Content)
    {
        self.viewModel = NavControllerViewModel(easing: easing)
        self.content = content()
        switch transition {
        case .custom(let trans):
            self.transitions = (trans, trans)
        case .none:
            self.transitions = (.identity, .identity)
        }
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            }
        }
    }
    
}
