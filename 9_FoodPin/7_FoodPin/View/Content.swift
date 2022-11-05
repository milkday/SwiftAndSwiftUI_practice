//
//  Exercise_2.swift
//  7_FoodPin
//
//  Created by zuozhongfei on 2022/11/3.
//

import SwiftUI

struct Content: View {
    
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location:"Hong Kong", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:"homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "HongKong", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location:"Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "NewYork", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)]
    
    var body: some View {
        List{
            ForEach(restaurants.indices, id: \.self) { index in
                FullImageRow2(restaurant: $restaurants[index])
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct Exercise_2_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}

struct FullImageRow2: View {
    
    // MARK: - Binding
    @Binding var restaurant: Restaurant
    
    // MARK: - State variables
    @State private var showOptions = false
    @State private var showError = false
    
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            HStack{
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .cornerRadius(20)
                    .padding(.top)
            }
            .shadow(color: .gray, radius: 10)
            
            
            HStack {
                VStack(alignment: .leading,spacing: 2) {
                    Text(restaurant.name)
                        .font(.system(.title2,design: .rounded))
                    Text(restaurant.type)
                        .font(.system(.body,design: .rounded))
                    Text(restaurant.location)
                        .font(.system(.subheadline,design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                if restaurant.isFavorite {
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
                            .default(Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")){
                                self.restaurant.isFavorite.toggle()
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
