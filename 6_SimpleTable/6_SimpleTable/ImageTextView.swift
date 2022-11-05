//
//  ImageTextView.swift
//  6_SimpleTable
//
//  Created by zuozhongfei on 2022/11/2.
//

import SwiftUI

struct ImageTextView: View {
    
    let title:String
    
    var body: some View {
        HStack{
            Image(title)
                .resizable()
                .frame(width: 40, height: 40)
            Text(title)
        }
    }
}

struct ImageTextView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTextView(title: "test")
    }
}
