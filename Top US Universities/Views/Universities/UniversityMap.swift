//
//  UniversityMap.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 16/07/2022.
//

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
