/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-basic-animations
*/

import SwiftUI

struct UniversityLandingPage: View {
    @State var scale = 0.1
    @Binding var showLandingPage: Bool
    
    var body: some View {
        VStack {
            
            // App Icon
            CircleImage(image: Image("university"))
            
            // Button to start view universities
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
            }
        }
        .scaleEffect(scale)
        .onAppear {
            
            // appearance animation with duration = 1
            _ = Animation.easeInOut(duration: 1)
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
