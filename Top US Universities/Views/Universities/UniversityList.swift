//
//  UniversityList.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

import SwiftUI

struct UniversityList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var searchText = ""
    
    var filteredUniversities: [University] {
        modelData.universities.filter { university in
              (!showFavoritesOnly || university.isFavorite)
          }
      }
    
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
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
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
