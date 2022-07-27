/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Nguyen Thi Thuy Tien
  ID: s3757934
  Created  date: 14/07/2022.
  Last modified: 28/07/2022.
  Acknowledgement: https://www.youtube.com/watch?v=CX-BdDHW0Ho
*/

import SwiftUI
import WebKit

struct YoutubeView: UIViewRepresentable {
    let  videoURL: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // check valid youtube url
        guard let youtubeURL = URL(string: videoURL) else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView(videoURL: "https://www.youtube.com/watch?v=Ku_E6a8Sac8")
    }
}
