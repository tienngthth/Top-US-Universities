/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://developer.apple.com/documentation/mapkit/mapmarker
*/

import SwiftUI
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct MapView: View {
    @State private var region = MKCoordinateRegion()
    var coordinates: [CLLocationCoordinate2D]
    var zoomDegree: [Double]

    var body: some View {
        // prepare a list of map maker annotation
        let markers = coordinates.map{ Marker(location: MapMarker(coordinate: $0, tint: .red)) }
        
        ZStack {
            
            // set map region and markers
            Map(coordinateRegion: $region, annotationItems: markers) { marker in
                marker.location
            }
            .onAppear {
                setRegion(coordinates.last!)
            }
            
            // button to zoom in and out
            VStack {
                
                // zoom in button
                Button(action: {
                    zoomIn()
                }) {
                    Text("➕")
                }
                
                // zoom out button
                Button(action: {
                    zoomOut()
                }) {
                    Text("➖")
                }
            }
            .buttonStyle(.bordered)
            .controlSize(.small)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .offset(x: -10, y: -30)
            
        }
    }
    
    private func zoomIn() {
        region.span.latitudeDelta *= 0.5
        region.span.longitudeDelta *= 0.5
    }
    
    private func zoomOut() {
        if ((region.span.latitudeDelta + region.center.latitude) < 90) {
            region.span.latitudeDelta *= 2
            region.span.longitudeDelta *= 2
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
           center: coordinate,
           span: MKCoordinateSpan(latitudeDelta: zoomDegree[0], longitudeDelta: zoomDegree[1])
        )
   }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: [CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)], zoomDegree: [0.0001, 0.01])
    }
}
