//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Simon Ng on 21/9/2021.
//

import SwiftUI

@main
struct FoodPinApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
    
//    init() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
//        navBarAppearance.backgroundColor = .white
//        navBarAppearance.backgroundEffect = .none
//        navBarAppearance.shadowColor = .clear
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//        UINavigationBar.appearance().compactAppearance = navBarAppearance
//    }
}
