//
//  StackDemoView.swift
//  2_StackViewDemo
//
//  Created by 左忠飞 on 2022/10/28.
//

import SwiftUI

struct StackDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Instant Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                
                Text("Get help from experts in 15 minutes")
            }
            
            HStack(alignment: .bottom, spacing: 10) {
                Image("user1")
                    .resizable()
                    .scaledToFit()
                
                Image("user2")
                    .resizable()
                    .scaledToFit()
                
                Image("user3")
                    .resizable()
                    .scaledToFit()
                
                
            }
            .padding(.horizontal,20)
            Text("Need help with coding problems? Register!")

            
            Spacer()
            
            SignUpButtonGroup()
        }
        .padding(.top,30)
    }
}

struct StackDemoView_Previews: PreviewProvider {
    static var previews: some View {
        StackDemoView()
    }
}

struct SignUpButtonGroup: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        if verticalSizeClass == .compact {
            HStack {
                Button {
                    print("sign up")
                } label: {
                    Text("Sign Up")
                }
                .frame(width:200)
                .padding()
                .foregroundColor(.white)
                .background(Color.indigo)
                .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("log In")
                }
                .frame(width:200)
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(10)
            }
        }else{
            VStack {
                Button {
                    print("sign up")

                } label: {
                    Text("Sign Up")
                }
                .frame(width:200)
                .padding()
                .foregroundColor(.white)
                .background(Color.indigo)
                .cornerRadius(10)
                
                Button {
                    
                } label: {
                    Text("log In")
                }
                .frame(width:200)
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(10)
            }
        }
        
    }
}
