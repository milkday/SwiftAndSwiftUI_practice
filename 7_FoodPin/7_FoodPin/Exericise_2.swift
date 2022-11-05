//
//  Exericise_2.swift
//  7_FoodPin
//
//  Created by zuozhongfei on 2022/11/2.
//

import SwiftUI

struct Exericise_2: View {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney",
    "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/ Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var body: some View {
        List{
            ForEach(restaurantNames.indices,id:\.self){ index in
                VStack(alignment:.leading,spacing: 10) {
                    HStack{
                        Image(restaurantImages[index])
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .cornerRadius(20)
                            .padding(.top)
                    }
                    .shadow(color: .gray, radius: 10)
                    
                    
                    VStack(alignment: .leading,spacing: 2) {
                        Text(restaurantNames[index])
                            .font(.system(.title2,design: .rounded))
                        Text(restaurantTypes[index])
                            .font(.system(.body,design: .rounded))
                        Text(restaurantLocations[index])
                            .font(.system(.subheadline,design: .rounded))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)

                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct Exericise_2_Previews: PreviewProvider {
    static var previews: some View {
        Exericise_2()
    }
}
