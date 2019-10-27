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
	@State private var rotation = 0.0
	@State private var opacity = 1.0
    
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
						self.opacity = 0.25
						self.flaggTapped(number)
						if self.didSelectCorrectAnswer {
							withAnimation {
								self.rotation = 360
							}
						} else {
							self.rotation = 0
						}
					}) {
						Image(self.countries[number]).renderingMode(.original)
							.clipShape(RoundedRectangle(cornerRadius: 8.0))
							.shadow(color: .black, radius: 2.0, x: 1, y: 2)
					}
						
					.opacity((number == self.correctAnswer) ? 1 : self.opacity)
					.rotation3DEffect(.degrees((number == self.correctAnswer) ? self.rotation : 0), axis: (x: 0, y: 1, z: 0))
					.animation(.easeInOut(duration: 1.0), value: self.didSelectCorrectAnswer)
                }

				Text("Score: \(score)")
				.font(.title)
				.fontWeight(.light)
				.shadow(color: .black, radius: 2.0, x: 1, y: 1)
                Spacer()
				
				Button(action: {
					self.askQuestion()
				}) {
					Text("Guess again?")
						.font(.headline)
					.padding(70)
					.background(Color.red)
					.foregroundColor(.white)
					.clipShape(Circle())
						.shadow(color: .black, radius: 2.0, x: 1, y: 2)
				}
             Spacer()
			}
			
		}
//		.alert(isPresented: $isShowingScore) { () -> Alert in
//		Alert(title: Text(scoreTitle), message: Text("That is the flag of \(countries[currentAnswer])"), dismissButton: .default(Text("Continue"), action: {
//			self.askQuestion()
//		}))
//		}
	}
    
    // MARK: End of View
    func flaggTapped(_ number: Int) {
        currentAnswer = number
        
        if number == correctAnswer {
			didSelectCorrectAnswer = true
//            scoreTitle = "Correct"  // Removed after .alert was disabled.
            score += 1
        } else {
			didSelectCorrectAnswer = false
//            scoreTitle = "Wrong" // Removed after .alert was disabled.
            score -= 1
        }
		
		/* Removed after .alert was disabled.
		 // .alert was disabled to better show the animations.
		 // isShowingScore = true
		*/
    }
    
    func askQuestion() {
		rotation = 0
		opacity = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
