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

struct UniversityMap: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        MapView(coordinates: modelData.universities.map{ $0.locationCoordinate }, zoomDegree: [50.0,100.0])
    }
}

struct UniversityMap_Previews: PreviewProvider {
    static var previews: some View {
        UniversityMap()
            .environmentObject(ModelData())
    }
}
