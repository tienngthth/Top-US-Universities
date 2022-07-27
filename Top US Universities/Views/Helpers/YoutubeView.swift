//
//  YoutubeView.swift
//  Top US Universities
//
//  Created by Tien Nguyen on 17/07/2022.
//

import SwiftUI
import WebKit

struct YoutubeView: UIViewRepresentable {
    let  videoURL: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: videoURL) else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
        
    }
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView(videoURL: "https://www.youtube.com/watch?v=Ku_E6a8Sac8")
    }
}
