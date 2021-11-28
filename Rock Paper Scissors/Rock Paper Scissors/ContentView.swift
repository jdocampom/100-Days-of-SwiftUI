//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Juan Diego Ocampo on 28/11/21.
//

import SwiftUI

struct ContentView: View {
    
    let gradient = Gradient(colors: [.black, .red])
    var choice = ["🪨", "📄", "✂️"]
    
    @State var score = 0
    @State private var computerChoice = Int.random(in: 0 ..< 3)
    @State private var shouldWin = Bool.random()
    
    var goodAnswer: Int {
        if shouldWin == true {
            if computerChoice == 2 {
                return 0
            } else {
                return computerChoice + 1
            }
        } else {
            if computerChoice == 2 {
                return 1
            } else if computerChoice == 1 {
                return 0
            } else {
                return 2
            }
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack{
                    Text("Rock, Papper or Scissors")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 10.0)
                    Text("Computer has chosen \(choice[computerChoice])")
                        .bold()
                        .padding(.bottom, 10.0)
                    HStack {
                        Text("Your turn to")
                        Text("\(shouldWin ? "WIN" : "LOSE")")
                            .bold()
                    }
                    .padding(.bottom, 10.0)
                    Text("Choose: ")
                        .padding(.bottom, 10.0)
                    HStack(alignment: .center, spacing: 40) {
                        ForEach(0 ..< 3) { item in
                            Spacer()
                            Button(action: {
                                self.checkChoice(item)
                            }, label: {
                                Text("\(choice[item])")
                                    .font(.title)
                                    .padding(.bottom)
                            })
                        }
                        Spacer()
                    }
                    Text("Score: \(score)")
                        .font(.body)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
            .padding()
        }
    }
    
    func checkChoice(_ item: Int) {
        if item == self.goodAnswer {
            score += 1
            next()
        } else {
            score -= 1
            next()
        }
    }
    
    func next() {
        computerChoice = Int.random(in: 0 ..< 3)
        shouldWin = Bool.random()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
