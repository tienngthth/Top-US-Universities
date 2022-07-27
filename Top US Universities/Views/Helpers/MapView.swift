//
//  MapView.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

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
        let markers = coordinates.map{ Marker(location: MapMarker(coordinate: $0, tint: .red)) }
        ZStack {
            Map(coordinateRegion: $region, annotationItems: markers) { marker in
                    marker.location
                }
                .onAppear {
                    setRegion(coordinates.last!)
                }
            VStack {
                Button(action: {
                        region.span.latitudeDelta *= 0.5
                        region.span.longitudeDelta *= 0.5
                }) {
                    Text("➕")
                }
                Button(action: {
                    if ((region.span.latitudeDelta + region.center.latitude) < 90) {
                        region.span.latitudeDelta *= 2
                        region.span.longitudeDelta *= 2
                    }
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
