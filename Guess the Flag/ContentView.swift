//
//  ContentView.swift
//  Guess the Flag
//
//  Created by RANGA REDDY NUKALA on 21/08/20.
//

import SwiftUI


struct ContentView: View {
    
    @State private var countries = ["BHUTAN","BRAZIL","CAMBODIA","INDIA","IRELAND","ITALY","MICRONESIA","SLOVAKIA","SUDAN","SWEDEN","US","VIETNAM"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var showingScore = false
    @State private var scoreTitle = ""

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.5803921569, green: 0.7333333333, blue: 0.9137254902, alpha: 1))]), center: .center, startRadius: 5, endRadius: 500)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                    VStack(spacing: 10) {
                        Text("Tap the Flag of")
                        Text(countries[correctAnswer])
                            .bold()
                    }
                    
                    
                    ForEach(0..<3) { number in
                        Button(action: {
                            self.flagTapped(number)
                            
                        }, label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .frame(height: 180, alignment: .center)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                .shadow(color: Color.black.opacity(0.17), radius: 10)
                                
                        })
                    }
                }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is ???"), dismissButton: .default(Text("Continue")) {
                print("ss")
            })
    }
        
        
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuetion() {
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
