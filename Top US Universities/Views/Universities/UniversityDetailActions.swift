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

struct UniversityDetailActions: View {
    var university: University
    
    var body: some View {
        HStack {
            Spacer()
            ConfirmButton(
                buttonText: "Call Phone",
                buttonImage: "phone",
                confirmSubMessage: "The app wants to make a phone call",
                confirmMessage: "Call \(university.phone)",
                customConfirm: false,
                url: "tel:\(university.phone.replacingOccurrences(of: " ", with: ""))")
            Spacer()
            ConfirmButton(
                buttonText: "Open Map",
                buttonImage: "map",
                confirmSubMessage: "The app wants to open web browser",
                confirmMessage: "Open Map",
                customConfirm: true,
                url: university.mapLink)
            Spacer()
            ConfirmButton(
                buttonText: "Open Site",
                buttonImage: "arrow.up.right",
                confirmSubMessage: "The app wants to open web browser",
                confirmMessage: "Open School Website",
                customConfirm: true,
                url: university.officialLink)
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct UniversityDetailActions_Previews: PreviewProvider {
    static var previews: some View {
        UniversityDetailActions(university: ModelData().universities[5])
            .environmentObject(ModelData())
    }
}
