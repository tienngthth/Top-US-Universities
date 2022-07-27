/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct UniversityRow: View {
    var university: University
    
    var body: some View {
        HStack {
            
            // university image
            university.images[0]
                .resizable()
                .frame(width: 50, height: 50)
            
            // university name and rating
            Text("#\(university.rating) \(university.name)")
            Spacer()
            
            // university favorite mark
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

