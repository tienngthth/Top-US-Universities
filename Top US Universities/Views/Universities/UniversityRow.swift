//
//  UniversityRow.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

import SwiftUI

struct UniversityRow: View {
    var university: University
    
    var body: some View {
        HStack {
            university.images[0]
                .resizable()
                .frame(width: 50, height: 50)
            Text("#\(university.rating) \(university.name)")
            Spacer()
            if university.isFavorite {
               Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
           }
        }
    }
}

struct UniversityRow_Previews: PreviewProvider {
    static var universities = ModelData().universities
    
    static var previews: some View {
        Group {
            UniversityRow(university: universities[0])
            UniversityRow(university: universities[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

