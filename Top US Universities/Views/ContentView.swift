//
//  ContentView.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 14/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var showLandingPage: Bool = true
    
    var body: some View {
        if (showLandingPage) {
            UniversityLandingPage(showLandingPage: $showLandingPage)
        } else {
            UniversityHome()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
