//
//  ReviewView.swift
//  FoodPin
//
//  Created by 左忠飞 on 2022/11/9.
//

import SwiftUI

struct ReviewView: View {
    
    var restaurant:Restaurant
    @Binding var isDisplayed:Bool
    @State private var showRatings = false
    
    var body: some View {
        ZStack{
            
            Image(uiImage: UIImage(data: restaurant.image)!)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.5)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            HStack{
                Spacer()
                
                VStack {
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            self.isDisplayed = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                ForEach(Restaurant.Rating.allCases,id:\.self){ rating in
                    HStack {
                        Image(rating.image)
                        
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title,design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading)

                    }
                    .opacity(showRatings ? 1 : 0)
                    .offset(x:showRatings ? 0 : 1000)
                    .animation(.easeOut.delay(Double(Restaurant.Rating.allCases.firstIndex(of: rating)!) * 0.05), value: showRatings)
                    .onTapGesture {
                        self.restaurant.rating = rating
                        self.isDisplayed = false
                    }
                }
            }
        }
        .onAppear{
            DispatchQueue.main.async {
                showRatings.toggle()
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(restaurant:(PersistenceController.testData?.first)!, isDisplayed: .constant(true))
    }
}
