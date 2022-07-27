//
//  CircleImage.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .frame(width: 150, height: 150)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("harvard"))
    }
}
