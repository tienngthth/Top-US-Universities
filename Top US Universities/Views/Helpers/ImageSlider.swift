//
//  ImageSlider.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 17/07/2022.
//

import SwiftUI

struct ImageSlider: View {
    var images: [Image]
        
    var body: some View {
        TabView {
            ForEach(0..<images.count, id: \.self) { item in
                images[item]
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ImageSlider(images: modelData.universities[0].images)
           .previewLayout(.fixed(width: 400, height: 300))
    }
}
