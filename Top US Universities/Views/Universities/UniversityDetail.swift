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

import SwiftUI

struct UniversityDetail: View {
    @EnvironmentObject var modelData: ModelData
    var university: University
    
    // index of the current university
    var universityIndex: Int {
        modelData.universities.firstIndex(where: { $0.id == university.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // image slider
                ImageSlider(images: university.images)
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                // circle image profile
                CircleImage(image: university.images[0])
                    .offset(y: -80)
                    .offset(x: 20)
                    .padding(.bottom, -80)
                
                // university information
                VStack(alignment: .leading) {
                    Group {
                        
                        // univeristy rank
                        Text("\(getIcon(rank: university.rating))#\(String(university.rating))")
                            .fontWeight(.bold)
                        
                        HStack(alignment: .top) {
                            
                            // univeristy name
                            Text(university.name)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.trailing, 10)
                            
                            // button to mark university as favorite
                            FavoriteButton(isSet: $modelData.universities[universityIndex].isFavorite)
                            
                            // button to share university link
                            ShareButton(university: university)
                        }
                        Text(university.fullAddress)
                        Text(university.phone)
                        Text(university.officialLink)
                    }
                    .padding(.bottom, 2)
                    
                    Group {
                        
                        // buttons to make phone call, open map, official link
                        Divider()
                        UniversityDetailActions(university: university)
                        
                        // university description
                        Divider()
                        Text(university.description)
                            .lineSpacing(12)
                        
                        // university map view
                        Divider()
                        MapView(coordinates: [university.locationCoordinate], zoomDegree: [0.0001, 0.01])
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)
                        
                        // university official youtube
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
    
    // function to get icon w.r.t university rank
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
