//
//  ImageViewContainer.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/24/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI

struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: ImagesManager
    
    init(imageUrl: String?) {
        remoteImageURL = ImagesManager(resourseURL: URL(string: imageUrl ?? String()))
    }
    
    var body: some View {
        
        if let uiImage = UIImage(data: self.remoteImageURL.data) {
            return AnyView(Image(uiImage: uiImage)
                .resizable()
                .frame(width: 250, height: 600)
                .aspectRatio(contentMode: .fit))
        } else {
            return AnyView(Image(systemName: "paintbrush")
                .onAppear(perform: { self.remoteImageURL.loadImage() }))
        }
    }
}
