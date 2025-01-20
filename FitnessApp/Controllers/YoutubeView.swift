//
//  YoutubeView.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 16/01/25.
//

import SwiftUI
import WebKit

struct YoutubeView: View {
    let videoID: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            WebView(url: URL(string: "https://www.youtube.com/embed/\(videoID)")!)
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                dismiss()
            }) {
                Text("Cerrar Video")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color(red: 165/255, green: 72/255, blue: 238/255))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .background(Color(red: 24/255, green: 23/255, blue: 50/255))
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    YoutubeView(videoID: "pfX1XDy3lP8")
}
