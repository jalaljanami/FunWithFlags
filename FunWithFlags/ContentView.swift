//
//  ContentView.swift
//  FunWithFlags
//
//  Created by Glory's Macmini on 10/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var Flag: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain" , "UK", "Ukraine", "US"].shuffled()
    @State private var currectAnswer = Int.random(in: 0...2)
    
    @State private var showAlert = false
    @State private var score = 0
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color.blue, Color.black], startPoint: .top, endPoint: .bottom)
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
            
            
                
            VStack(spacing: 32) {
                Spacer()
                Spacer()
                
                Text("Fun With Flags")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(
                        Color.white
                    )
                
                ZStack {
                    
                    Rectangle()
                        .background(
                            .ultraThinMaterial
                        )
                        .clipShape(Capsule())
                        .padding(.bottom, -32)
                        
                    VStack(spacing: 32) {
                        
                        VStack(spacing: 0) {
                            Text("Select the flag of")
                                .font(.subheadline)
                                .foregroundStyle(
                                    Color.white
                                )
                            Text(Flag[currectAnswer])
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(
                                    Color.white
                                )
                        }
                        
                        ForEach(0..<3) { index in
                            Button {
                                checkAnswer(index)
                                restoreQuestion()
                            } label: {
                                Image(Flag[index])
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                                            .strokeBorder(.white, lineWidth: 3)
                                            .opacity(0.3)
                                    }
                                    .shadow(radius: 10)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Text("\(score)")
                    .font(.largeTitle.weight(.heavy))
                    .foregroundStyle(.white)
                Spacer()
            }
            
            .frame(width: .infinity, height: .infinity)
            .padding(.horizontal, 32)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("You Won, So What"), message: Text("It's Done Go Your Home"))
                
            })
//            .background(
//                .ultraThinMaterial
//            )
        }
        .preferredColorScheme(.light)
        .ignoresSafeArea()
    }
    
    func checkAnswer(_ index: Int) {
        if index == currectAnswer {
            print("Correct")
            score += 1
        }
    }
    
    func restoreQuestion() {
        Flag.shuffle()
        currectAnswer = Int.random(in: 0...2)
        if score == 15 {
            showAlert.toggle()
            score = 0
        }
    }
}

#Preview {
    ContentView()
}
