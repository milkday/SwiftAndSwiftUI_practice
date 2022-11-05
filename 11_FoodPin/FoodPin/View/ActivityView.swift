//
//  ActivityView.swift
//  FoodPin
//
//  Created by 左忠飞 on 2022/11/4.
//

import Foundation
import SwiftUI

struct ActivityView:UIViewControllerRepresentable {
    
    var activityItems:[Any]
    var applicationActivities:[UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return activityController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
