//
//  ConfirmButton.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 17/07/2022.
//

import SwiftUI

struct ConfirmButton: View {
    @State private var isPresentingConfirm: Bool = false
    var buttonText: String
    var buttonImage: String
    var confirmSubMessage: String
    var confirmMessage: String
    var url: String
    
    var body: some View {
        Button(action: {
            isPresentingConfirm = true
        }) {
            VStack {
                Image(systemName: buttonImage)
                Text(buttonText)
                    .padding(1)
            }
        }
        .confirmationDialog("Are you sure?",
             isPresented: $isPresentingConfirm) {
             Button(confirmMessage) {
                 performAction()
              }
            } message: {
                Text(confirmSubMessage)
            }
        .buttonStyle(.bordered)
        .controlSize(.small)
        .tint(.blue)
    }
    
    func performAction() {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
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
            url: "0123456789"
        )
    }
}
