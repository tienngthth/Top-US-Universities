//
//  UniversityDetail.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

import SwiftUI

struct UniversityDetail: View {
    @EnvironmentObject var modelData: ModelData
    var university: University
    
    var universityIndex: Int {
            modelData.universities.firstIndex(where: { $0.id == university.id })!
        }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ImageSlider(images: university.images)
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                CircleImage(image: university.images[0])
                    .offset(y: -80)
                    .offset(x: 20)
                    .padding(.bottom, -80)
                VStack(alignment: .leading) {
                    Group {
                        Text("\(getIcon(rank: university.rating))#\(String(university.rating))")
                            .fontWeight(.bold)
                        HStack(alignment: .top) {
                            Text(university.name)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.trailing, 10)
                            FavoriteButton(isSet: $modelData.universities[universityIndex].isFavorite)
                            ShareButton(university: university)
                        }
                        Text(university.fullAddress)
                        Text(university.phone)
                        Text(university.officialLink)
                    }
                    .padding(.bottom, 2)
                    Group {
                        Divider()
                        UniversityDetailActions(university: university)
                        Divider()
                        Text(university.description)
                            .lineSpacing(12)
                        Divider()
                        MapView(coordinates: [university.locationCoordinate], zoomDegree: [0.0001, 0.01])
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)
                        Divider()
                        YoutubeView(videoURL: university.videoLink)
                            .frame(height: 350)
                    }
                    .padding(.bottom, 10)
                }
                .padding()
            }
        }
        .navigationTitle(university.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func getIcon(rank: Int) -> String {
        switch(rank) {
            case(1...5):
                return "♦️"
            case(6...10):
                return "🔸"
            default:
                return "🔹"
        }
    }
}

struct UniversityDetail_Previews: PreviewProvider {
    static var previews: some View {
        UniversityDetail(university: ModelData().universities[5])
            .environmentObject(ModelData())
    }
}