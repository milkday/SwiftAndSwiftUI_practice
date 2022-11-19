//
//  WebView.swift
//  FoodPin
//
//  Created by 左忠飞 on 2022/11/19.
//

import SwiftUI
import WebKit

struct WebView:UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)   
        uiView.load(request)
    }
}
