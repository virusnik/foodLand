//
//  BeersRow.swift
//  FoodLand
//
//  Created by Sergio Veliz on 3/17/20.
//  Copyright © 2020 Sergio Veliz. All rights reserved.
//

import SwiftUI
import ImagePackage

struct BeersRow: View {

    @EnvironmentObject var viewModel: BeersViewModel
    
    let item: BeersModelElement
    
    var body: some View {
        let imageManager = ImagesManager(resourseURL: URL(string: self.item.imageURL ?? String()))
        
        return HStack {
            ImageViewContainer(remoteImageUrl: imageManager, placeholder: Image("beer")) {
                $0
                .resizable()
                .scaledToFit()
                .frame(width: 90.0, height: 90.0)
            }
            
            VStack(alignment: .leading) {
                Text(item.name ?? "")
                    .font(.headline)
                    
                Text(item.descriptionBeer ?? "")
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .font(.callout)
                    .foregroundColor(.gray)
                
                if self.viewModel.isPageLoading && self.viewModel.items.isLast(item) {
                    Divider()
                    Text("Loading...")
                }
            }
            
        }
        
        
//        return VStack(alignment: .leading) {
//            ImageViewContainer(remoteImageUrl: imageManager, placeholder: Image("beer")) {
//                $0
//                .resizable()
//                .scaledToFit()
//                .frame(width: 40.0, height: 40.0)
//            }
//            Text(item.name ?? "")
//                .font(.headline)
//            Text(item.description ?? "")
//                .font(.callout)
//                .foregroundColor(.gray)
//
//            if self.viewModel.isPageLoading && self.viewModel.items.isLast(item) {
//                Divider()
//                Text("Loading...")
//            }
//        }
    }
}

struct BeersRow_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
