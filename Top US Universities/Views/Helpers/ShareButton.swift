//
//  ShareButton.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 17/07/2022.
//

import SwiftUI

struct ShareButton: View {
    var university: University
    
    func actionSheet() {
        guard let data = URL(string: university.officialLink) else { return }
        let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
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
