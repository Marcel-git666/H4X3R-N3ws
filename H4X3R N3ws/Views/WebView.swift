//
//  WebView.swift
//  H4X3R N3ws
//
//  Created by Marcel Mravec on 26.01.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
 
    var urlString: String?
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
        
    }
}
