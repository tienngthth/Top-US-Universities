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
            longitude: long
        )
    }
}
