//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by zuozhongfei on 2022/11/5.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    var restaurang:Restaurant
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment:.top) {
            Image(restaurang.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth:0,maxWidth: .infinity)
            .ignoresSafeArea()
            
            Color.black
                .frame(height:100)
                .opacity(0.8)
                .cornerRadius(20)
                .padding()
                .overlay{
                    VStack(spacing:5){
                        Text(restaurang.name)
                        Text(restaurang.type)
                        Text(restaurang.location)
                    }
                    .font(.system(.headline,design: .rounded))
                    .foregroundColor(.white)
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left"))\(restaurang.name)")
                        .shadow(color: .gray, radius: 5)
                }

            }
        }
        
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurang: Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend", isFavorite: true))
    }
}
