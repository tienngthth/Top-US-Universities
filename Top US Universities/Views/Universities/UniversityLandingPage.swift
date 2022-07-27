//
//  UniversityLandingPage.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 27/07/2022.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
          .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
  }
}


struct UniversityLandingPage: View {
    @State var scale = 0.1
    @Binding var showLandingPage: Bool
    var body: some View {
        VStack {
            CircleImage(image: Image("university"))
            HStack {
                Button(action: {
                    showLandingPage = false
                }) {
                    HStack  {
                        Text("Top US Universities")
                        Image(systemName: "arrow.right.circle")
                    }
                    .padding(.top, 30)
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                }
                .buttonStyle(MyButtonStyle())
            }
        }
        .scaleEffect(scale)
        .onAppear {
            _ = Animation.easeInOut(duration: 5)
            withAnimation() {
                scale = 1
            }
        }
    }
        
}

struct UniversityLandingPage_Previews: PreviewProvider {
    static var previews: some View {
        UniversityLandingPage(showLandingPage: .constant(true))
    }
}
