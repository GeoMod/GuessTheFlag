//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Daniel O'Leary on 10/13/19.
//  Copyright © 2019 Impulse Coupled Dev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var currentAnswer = 0
	@State private var didSelectCorrectAnswer = false
    
    var body: some View {
        
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.blue, .purple]), center: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of").foregroundColor(.white)
                    Text("\(countries[correctAnswer])").foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flaggTapped(number)
					}) {
						
						Image(self.countries[number]).renderingMode(.original)
							.clipShape(RoundedRectangle(cornerRadius: 8.0))
							.shadow(color: .black, radius: 2.0, x: 1, y: 2)
					}
                    
                }
                
                Text("Score: \(score)")
                    .font(.title)
                    .fontWeight(.light)
                    .shadow(color: .black, radius: 2.0, x: 1, y: 1)
                Spacer()
                
            }
            
        }.alert(isPresented: $isShowingScore) { () -> Alert in
            Alert(title: Text(scoreTitle), message: Text("That is the flag of \(countries[currentAnswer])"), dismissButton: .default(Text("Continue"), action: {
                self.askQuestion()
            }))
        }
    }
    
    // MARK: End of View
    func flaggTapped(_ number: Int) {
        currentAnswer = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        isShowingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
