/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://designcode.io/swiftui-handbook-share-sheet
*/

import SwiftUI

struct ShareButton: View {
    var university: University
    
    func actionSheet() {
        // check valid url
        guard let data = URL(string: university.officialLink) else { return }
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        
        // open the share window
        UIApplication.shared.windows.first?.rootViewController?.present(
            av,
            animated: true,
            completion: nil
        )
    }
    
    var body: some View {
        Button(action: actionSheet) {
            Image(systemName: "square.and.arrow.up")
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(university: ModelData().universities[5])
            .environmentObject(ModelData())
    }
}
