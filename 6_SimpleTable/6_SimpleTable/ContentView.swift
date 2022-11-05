//
//  ContentView.swift
//  6_SimpleTable
//
//  Created by zuozhongfei on 2022/11/1.
//

import SwiftUI

struct ContentView: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var body: some View {
        List{
            ForEach(restaurantNames,id:\.self) { name in
                ImageTextView(title: name)
            }
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 13Pro Max")
    }
}
