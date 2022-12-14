//
//  ContentView.swift
//  HelloWorld
//
//  Created by ε·¦εΏ ι£ on 2022/10/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            Text("Guess These Movies")
                .font(.system(.title,design: .rounded))
                .fontWeight(.bold)
            
            Text("Can you guess the movie from these emojis?\nTap the button to find out the answer")
                .font(.system(.body))
            
            MovieBotton(title: "πΆπ±", movieName: "Movie 1", backgroundColor: .yellow)
            MovieBotton(title: "πππ", movieName: "Movie 2", backgroundColor: .purple)
            MovieBotton(title: "π§¨π§¨π§¨", movieName: "Movie 3", backgroundColor: .orange)
            MovieBotton(title: "β€οΈβ€οΈβ€οΈ", movieName: "Movie 4", backgroundColor: .pink)
        }
        
    }
    
    func speak(text:String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
