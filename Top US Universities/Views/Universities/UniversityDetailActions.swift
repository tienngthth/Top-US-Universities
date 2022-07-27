//
//  UniversityDetailActions.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

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
                url: "tel://\(university.phone)")
            Spacer()
            ConfirmButton(
                buttonText: "Open Map",
                buttonImage: "map",
                confirmSubMessage: "The app wants to open web browser",
                confirmMessage: "Open Map",
                url: university.mapLink)
            Spacer()
            ConfirmButton(
                buttonText: "Open Site",
                buttonImage: "arrow.up.right",
                confirmSubMessage: "The app wants to open web browser",
                confirmMessage: "Open Scholl Website",
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
