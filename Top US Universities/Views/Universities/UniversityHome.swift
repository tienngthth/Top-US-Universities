/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces
*/

import SwiftUI

struct UniversityHome: View {
    @State private var selection: Tab = .list
    
    enum Tab {
        case map
        case list
    }
    
    var body: some View {
        //Tab view with 2 sections, map and list
        TabView(selection: $selection) {
            
            // Map of univeristies
            UniversityMap()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(Tab.map)

            // List of univeristies
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
