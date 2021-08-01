//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by nitish nayak n on 24/05/20.
//  Copyright © 2020 nitish nayak n. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreTitle = ""
          @State private var showingScore = false
    @State private var count=0
    @State private var status = ""
    
          
    
    @State private var flag = ["india","poland","uk","sweden","pakisthan","netharland"]
    @State private   var correctAnswer = Int.random(in: 0...2)
        
    var body: some View {
      
        
        
        ZStack{
            LinearGradient(gradient: Gradient(colors :[.blue, .black]), startPoint: .top, endPoint: .bottom)
        VStack(spacing:30){
            VStack(spacing : 20){
        Text("tap the flag of countries")
            .foregroundColor(Color.white)
            Text(flag[correctAnswer])
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.white)
        
        
        
       
            ForEach(0..<3){number in
                Button(action:{
                    self.flagTapped(number)
                }){
                    Image(self.flag[number]).renderingMode(.original).resizable()
                        .frame(width:200,height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .shadow(color: .black, radius: 3)
                    
                }
                
        
    }
            Spacer()
            
    }//1st vstack
    }//2nd vstack
    }//Zstack
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(status), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
}
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            
            count = count+1
            status = "Your score is \(count)"
            
        } else {
            scoreTitle = "Wrong"
            status = "wrong answer your choosen flag is \(flag[number])"
            
        }

        showingScore = true
        
    }
    func askQuestion() {
        flag.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
