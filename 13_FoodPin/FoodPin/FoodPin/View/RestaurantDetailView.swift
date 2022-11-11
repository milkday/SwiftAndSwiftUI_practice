//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Simon Ng on 28/9/2021.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var restaurant: Restaurant
    @State private var showReview = false
    @Environment(\.managedObjectContext) var context

    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: UIImage(data: restaurant.image)!)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height:445)
            }
            .overlay{
                Image(systemName: "heart.fill")
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .topTrailing)
                    .font(.system(size: 30))
                    .foregroundColor(restaurant.isFavorite ? .red : .white)
                    .padding(.top,50)
                    .padding(.trailing,20)
                HStack (alignment: .bottom){
                    VStack(alignment: .leading, spacing: 5){
                        Text(restaurant.name)
                            .font(.custom("Nunito-Regular", size: 35,relativeTo: .largeTitle))
                            .bold()
                        Text(restaurant.type)
                            .font(.system(.headline,design: .rounded))
                            .padding(.all,5)
                            .background(Color.black)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    .foregroundColor(.white)
                    .padding()
                    
                    if let rating = restaurant.rating ,!showReview{
                        Image(rating.image)
                            .resizable()
                            .frame(width: 60,height: 60)
                            .padding([.bottom,.trailing])
                            .transition(.scale)
                    }
                }
                .animation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.3), value: restaurant.rating)
            }
            
            Text(restaurant.summary)
                .padding()
            
            HStack(alignment:.top){
                VStack(alignment: .leading){
                    Text("ADDRESS")
                        .font(.system(.headline,design: .rounded))
                    Text(restaurant.location)
                }
                .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
                
                VStack(alignment:.leading){
                    Text("PHONE")
                        .font(.system(.headline,design: .rounded))
                    Text(restaurant.phone)
                }
                .frame(minWidth:0,maxWidth: .infinity,alignment: .leading)
            }
            .padding(.horizontal)
            
            NavigationLink {
                MapView(location: restaurant.location).edgesIgnoringSafeArea(.all)
            } label: {
                MapView(location: restaurant.location)
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .frame(height: 200)
                    .cornerRadius(20)
                    .padding()
            }
            
            Button {
                self.showReview.toggle()
            } label: {
                Text("Rate It")
                    .font(.system(.headline,design: .rounded))
                    .frame(minWidth: 0,maxWidth: .infinity)
            }
            .tint(Color("NavigationBarTitle"))
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 25))
            .controlSize(.large)
            .padding(.horizontal)
            .padding(.bottom,20)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Text("\(Image(systemName: "chevron.left"))")
                }
            }
        }
        .ignoresSafeArea()
        .overlay(
            self.showReview ? ZStack {
                ReviewView(restaurant: restaurant, isDisplayed: $showReview)
                    .navigationBarHidden(true)
            } : nil
        )
        .onChange(of: restaurant) { newValue in
            if self.context.hasChanges {
                try? self.context.save()
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailView(restaurant: (PersistenceController.testData?.first)!)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        .accentColor(.white)
    }
}
