//
//  Exercise1.swift
//  2_StackViewDemo
//
//  Created by 左忠飞 on 2022/10/28.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack(spacing:20){
            VStack{
                Text("Instant Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    
                Text("Get help from experts in 15 minutes")
                    .foregroundColor(.white)
            }
            HStack(alignment: .bottom,spacing: 10){
                Image("student")
                    .resizable()
                    .scaledToFit()
                
                Image("tutor")
                    .resizable()
                    .scaledToFit()
                
            }
            .padding(.horizontal,60)
            
            Text("Need help with coding problems? Register!")
                .foregroundColor(.white)
            
            Spacer()
            
            SignUpButtonGroup()
        }
        .background{
            Image("background")
                .resizable()
                .ignoresSafeArea()
        }
        
        
    }
}

struct Exercise1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1()
    }
}
