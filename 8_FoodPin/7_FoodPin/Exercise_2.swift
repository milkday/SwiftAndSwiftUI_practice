//
//  Exercise_2.swift
//  7_FoodPin
//
//  Created by zuozhongfei on 2022/11/3.
//

import SwiftUI

struct Exercise_2: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney",
    "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/ Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    var body: some View {
        List{
            ForEach(restaurantNames.indices,id:\.self){ index in
                FullImageRow2(imageName: restaurantImages[index],
                                  name: restaurantNames[index],
                                  type: restaurantTypes[index],
                                  location: restaurantLocations[index],
                                  isFavorite: restaurantIsFavorites[index])
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct Exercise_2_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_2()
    }
}

struct FullImageRow2: View {
    
    var imageName: String
    var name: String
    var type: String
    var location: String
    
    @State private var showOptions = false
    @State private var showError = false
    @State var isFavorite:Bool
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            HStack{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(20)
                    .padding(.top)
            }
            .shadow(color: .gray, radius: 10)
            
            
            HStack {
                VStack(alignment: .leading,spacing: 2) {
                    Text(name)
                        .font(.system(.title2,design: .rounded))
                    Text(type)
                        .font(.system(.body,design: .rounded))
                    Text(location)
                        .font(.system(.subheadline,design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                if isFavorite {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .frame(width: 60, height: 60, alignment: .top)
                }
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .actionSheet(isPresented: $showOptions) {
            ActionSheet(title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                            .default(Text("Reserve a table")){
                                self.showError.toggle()
                            },
                            .default(Text(isFavorite ? "Remove from favorites" : "Mark as favorite")){
                                self.isFavorite.toggle()
                            },
                            .cancel()
                        ])
        }
        .alert(isPresented: $showError) {
            Alert(title: Text("Not yet available"),
                  message: Text("Sorry, this feature is not available yea. Please retry latter."),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel())
        }
    }
}
