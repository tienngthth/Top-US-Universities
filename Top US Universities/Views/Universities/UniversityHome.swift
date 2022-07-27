//
//  UniversityHome.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 27/07/2022.
//

import SwiftUI

struct UniversityHome: View {
    @State private var selection: Tab = .list
    
    enum Tab {
            case map
            case list
        }
    
    var body: some View {
        TabView(selection: $selection) {
                UniversityMap()
                     .tabItem {
                         Label("Map", systemImage: "map")
                     }
                     .tag(Tab.map)

                UniversityList()
                     .tabItem {
                         Label("List", systemImage: "list.bullet")
                     }
                     .tag(Tab.list)
             }
    }
}

struct UniversityHome_Previews: PreviewProvider {
    static var previews: some View {
        UniversityHome()
            .environmentObject(ModelData())
    }
}
