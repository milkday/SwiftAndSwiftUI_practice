//
//  TutorialView.swift
//  FoodPin
//
//  Created by 左忠飞 on 2022/11/18.
//

import SwiftUI

struct TutorialView: View {
    
    let pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
    let pageSubHeadings = ["Pin your favorite restaurants and create your own food guide",
    "Search and locate your favorite restaurant on Maps",
    "Find restaurants shared by your friends and others"
                            ]
    let pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]

    @State private var currentPage = 0
    @Environment(\.dismiss) var dismiss
    @AppStorage("hasViewedWalkthrouth") var hasViewedWalkthrouth: Bool = false

    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(pageHeadings.indices) { index in
                    TutorialPage(image: pageImages[index], heading: pageHeadings[index], SubHeading: pageSubHeadings[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .animation(.default, value: currentPage)
            
            VStack(spacing: 20) {
                Button {
                    if currentPage < pageHeadings.count - 1 {
                        currentPage += 1
                    }else{
                        hasViewedWalkthrouth = true
                        dismiss()
                    }
                } label: {
                    Text(currentPage == pageHeadings.count - 1 ? "GET STARTED" : "NEXT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal,50)
                        .background(Color(.systemIndigo))
                        .cornerRadius(25)
                }
                
                if currentPage < pageHeadings.count - 1 {
                    Button {
                        hasViewedWalkthrouth = true
                        dismiss()
                    } label: {
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color(.darkGray))
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
}

struct TutorialPage:View {
    let image: String
    let heading: String
    let SubHeading: String
    
    var body: some View {
        VStack(spacing: 70) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                
                Text(SubHeading)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal,40)
            
            Spacer()
        }
        .padding(.top)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
        TutorialPage(image: "onboarding-1", heading: "CREATE YOUR OWN FOODGUIDE", SubHeading: "Pin your favorite restaurants and create your own food guide")
    }
}
