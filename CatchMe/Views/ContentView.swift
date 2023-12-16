//
//  ContentView.swift
//  CatchMe
//
//  Created by Hassan Alkhafaji on 11/30/23.
//

/*
 Model - Item
            - Emoji
            - isTapped
 
 View Model -
        array of items (your model)
 
        - functionality of changing whether an item has been tapped or not
 
 */





import SwiftUI

struct Game: View {
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                BackgroundView()
                
                VStack {
                    
                    
                    GameStartedView()
                    
                    ItemView()
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
}

#Preview {
    Game()
}






struct BackgroundView: View {
    var body: some View {
        ZStack {
           
            VStack(spacing: -10) {
                Image("bg")
                    .resizable()
                    .frame(maxWidth: 450, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .scaledToFill()
                
           
                RoundedRectangle(cornerRadius: 80)
                    .foregroundColor(Color("Color"))
                    .frame(height: 120)
                    .shadow(radius: 10, x: 0, y: -20)
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
        }
    }
}

struct GameStartedView: View {
    @ObservedObject var viewModel = GameViewModel()
    @State var countdown = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        if viewModel.gameStarted == false {
            HStack{
                Text("CatchME")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                    .shadow(radius: 10)
                    .padding(10)
                    .frame(width: 350, height: 75)
                    .background(.teal.opacity(0.6))
                    .cornerRadius(20)
            }
            Spacer()
            Button(
                action: {
                    viewModel.gameStarted.toggle()
                    print("Started!")
                    
                },
                label: {
                    
                    Text("Start Game")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .padding()
                        .background(.ultraThinMaterial.opacity(0.7))
                        .cornerRadius(20)
                        .shadow(radius: 10, x: 0, y: 20)
                })
            
        } else {
            HStack{
                Spacer()
                Text("CatchME")
                    .font(.largeTitle.bold())
                    .shadow(radius: 10)
                   Spacer()
                VStack {
                    Text("Score")
                    Text("\(viewModel.model.score)")
                    
                }
                .font(.title)

            }
            .foregroundColor(.white)
            .padding(10)
            .frame(width: 350, height: 75)
            .background(.teal.opacity(0.6))
            .cornerRadius(20)
            if countdown != 0 {
               
                
                Spacer()
                
                Text("\(countdown)")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .padding()
                    .background(.ultraThinMaterial.opacity(0.7))
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 0, y: 20)
                    .onReceive(timer) { time in
                        if countdown > 0 {
                            countdown -= 1
                        }
                    }
            }
        }
    }
}

struct ItemView: View {
    
    @State var moneyDropping = 0
    @State var rotateMoney = 0.0
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(viewModel.model.emoji, id: \.self) { item in
                Text(item.item)
                    .font(.largeTitle)
                    .padding()
                    .background(Circle().foregroundColor(.gray).opacity(0.8))
                    .rotationEffect(.degrees(Double(rotateMoney)))
                    .rotation3DEffect(
                        .degrees(30),
                        axis: (x: 0, y: 0, z: 0.0)
                    )
                    .foregroundColor(.black)
                    .offset(y: CGFloat(moneyDropping))
                    .animation(Animation.easeIn(duration: 1.5).delay(0.5).repeatForever(autoreverses: false))
                    .onAppear() {
                        moneyDropping = 300
                        rotateMoney = 360
                    }
                    
                
                    
            }
        }
    }
    
}


