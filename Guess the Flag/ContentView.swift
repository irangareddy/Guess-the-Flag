//
//  ContentView.swift
//  Guess the Flag
//
//  Created by RANGA REDDY NUKALA on 21/08/20.
//

import SwiftUI


struct ContentView: View {
    
    let gradientStyles = ["Linear", "Radial", "Angular"]
    
    @State private var gradientIndex = 2
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            if gradientIndex == 0 {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.03529411765, green: 0.7764705882, blue: 0.9764705882, alpha: 1)), Color(#colorLiteral(red: 0.01568627451, green: 0.3647058824, blue: 0.9137254902, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            } else if gradientIndex == 1 {
                RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9333333333, green: 0.6823529412, blue: 0.7921568627, alpha: 1)), Color(#colorLiteral(red: 0.5803921569, green: 0.7333333333, blue: 0.9137254902, alpha: 1))]), center: .center, startRadius: 5, endRadius: 500)
                    .edgesIgnoringSafeArea(.all)
            } else {
                AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), center: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            }
           
            VStack {
                Section(header: Text("Select Gradient Style").padding()) {
                                        Picker("Gradient Styles", selection: $gradientIndex) {
                                            ForEach(0..<gradientStyles.count){
                                                Text("\(gradientStyles[$0])")
                                            }
                         }.pickerStyle(SegmentedPickerStyle())
                }.padding(8)
                Spacer()
                Button(action: {
                    if gradientIndex < 2 {
                        gradientIndex+=1
                    } else {
                        gradientIndex = 0
                    }
                }, label: {
                    Text("Change Background")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
            
                Image("INDIA")
                
                Spacer()
                Button("Show Alert") {
                    self.showAlert.toggle()
                }.alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Alert"), message: Text("This is a alert message"), dismissButton: .default(Text("Cancel")))
                })
            }
                
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
