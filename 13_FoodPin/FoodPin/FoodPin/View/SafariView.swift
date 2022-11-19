//
//  SafariView.swift
//  FoodPin
//
//  Created by 左忠飞 on 2022/11/19.
//


import SwiftUI
import SafariServices

struct SafariView:UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
}
