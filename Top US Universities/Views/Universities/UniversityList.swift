/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://developer.apple.com/tutorials/swiftui/handling-user-input
*/

import SwiftUI

struct UniversityList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    
    // filter universities based on option show faviourite only
    var filteredUniversities: [University] {
        modelData.universities.filter { university in
            (!showFavoritesOnly || university.isFavorite)
        }
    }
    
    // filter universities by search value
    var searchedUniversities: [University] {
        if searchText.isEmpty {
            return filteredUniversities
        } else {
            return filteredUniversities.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                
                // toggle button to show favorite universities only
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                // link to each universitiy view
                ForEach(searchedUniversities) { university in
                    NavigationLink {
                        UniversityDetail(university: university)
                    } label: {
                        UniversityRow(university: university)
                    }
                }
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .navigationTitle("Top US Universities 📚")
        }
    }
}

struct UniversityList_Previews: PreviewProvider {
    static var previews: some View {
        UniversityList()
            .environmentObject(ModelData())
    }
}
