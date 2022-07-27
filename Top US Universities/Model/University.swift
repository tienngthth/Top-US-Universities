//
//  University.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct University: Hashable, Codable, Identifiable {
    var name: String
    var yearFounded: Int
    var rating: Int
    var phone: String
    var description: String
    var fullAddress: String
    var mapLink: String
    var isFavorite: Bool
    var officialLink: String
    var videoLink: String
    
    var id: String {
        name
    }
    
    private var imageNames: [String]
    var images: [Image] {
        imageNames.map{Image($0)}
    }
    
    private var lat: Double
    private var long: Double
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: lat,
                longitude: long)
        }
    
  
}
