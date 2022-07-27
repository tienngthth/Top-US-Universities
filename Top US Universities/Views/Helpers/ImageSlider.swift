/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://medium.com/@mahdi.mahjoobi/image-slider-in-swiftui-59bac18ae4f4
*/

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
