/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://useyourloaf.com/blog/swiftui-confirmation-dialogs/
*/

import SwiftUI

struct ConfirmButton: View {
    @State private var isPresentingConfirm: Bool = false
    var buttonText: String
    var buttonImage: String
    var confirmSubMessage: String
    var confirmMessage: String
    var customConfirm: Bool
    var url: String
    
    var body: some View {
        
        // check if action needs custom confirmation dialog
        if customConfirm {
            
            // action button
            Button(action: {
                
                // open confirmation dialog when button is pressed
                isPresentingConfirm = true
            }) {
                VStack {
                    Image(systemName: buttonImage)
                    Text(buttonText)
                        .padding(1)
                }
            }
            .confirmationDialog(
                "Are you sure?",
                 isPresented: $isPresentingConfirm) {
                     
                     // check valid url and present a link to the url
                    if let urlVal = URL(string: url) {
                        Link(confirmMessage, destination: urlVal)
                    }
                } message: {
                    Text(confirmSubMessage)
                }
            .buttonStyle(.bordered)
            .controlSize(.small)
            .tint(.blue)
        } else {
            
            // check valid url and present a link to the url
            if let urlVal = URL(string: url) {
                Link(destination: urlVal) {
                    VStack {
                        Image(systemName: buttonImage)
                        Text(buttonText)
                            .padding(1)
                    }
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
                .tint(.blue)
            }
        }
    }
}

struct ConfirmButton_Previews: PreviewProvider {
    func handle(item: String) {}
    
    static var previews: some View {
        ConfirmButton(
            buttonText: "Call Phone",
            buttonImage: "phone",
            confirmSubMessage: "The app wants to make a phone call",
            confirmMessage: "Call 0123456789",
            customConfirm: true,
            url: "0123456789"
        )
    }
}
