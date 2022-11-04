//
//  MovieBotton.swift
//  HelloWorld
//
//  Created by 左忠飞 on 2022/10/28.
//

import SwiftUI
import AVFoundation

struct MovieBotton: View {
    
    let title:String
    let movieName:String
    let backgroundColor:Color
    
    var body: some View {
        Button {
            speak(text: movieName)
        } label: {
            Text(title)
                .fontWeight(.bold)
                .font(.system(.title,design: .rounded))
        }
        .padding()
        .foregroundColor(.white)
        .background(backgroundColor)
        .cornerRadius(20)
    }
    
    func speak(text:String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

struct MovieBotton_Previews: PreviewProvider {
    static var previews: some View {
        MovieBotton(title: "aaa", movieName: "real name", backgroundColor: .yellow)
    }
}
