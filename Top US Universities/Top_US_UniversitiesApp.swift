//
//  Top_US_UniversitiesApp.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

import SwiftUI

@main
struct Top_US_UniversitiesApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
