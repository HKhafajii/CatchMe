//
//  SwiftUIView.swift
//  CatchMe
//
//  Created by Hassan Alkhafaji on 12/13/23.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var moneyDropping = 0
    @State var rotateMoney = 0.0
    
    @ObservedObject var viewModel = GameViewModel()

    var body: some View {
        ZStack {
            HStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke()
                    .frame(width: 20, height: 20, alignment: .center)
                    .overlay(Image(systemName: "dollarsign.fill"))
                    .rotationEffect(.degrees(Double(rotateMoney)))
                    .rotation3DEffect(
                        .degrees(30),
                        axis: (x: 1, y: 1.0, z: 0.0)
                    )
                    .padding()
                    .background(Circle().foregroundColor(.white).opacity(0.5))
                    .foregroundColor(.black)
                    .offset(y: CGFloat(moneyDropping))
                    .animation(Animation.easeIn(duration: 1.5).delay(0.5).repeatForever(autoreverses: false))
                    .onAppear() {
                        moneyDropping = 300
                        rotateMoney = 360
                    }
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke()
                    .frame(width: 20, height: 20, alignment: .center)
                    .overlay(Image(systemName: "dollarsign.fill"))
                    .rotationEffect(.degrees(Double(rotateMoney)))
                    .rotation3DEffect(
                        .degrees(30),
                        axis: (x: 1, y: 1.0, z: 0.0)
                    )
                    .padding()
                    .background(Circle().foregroundColor(.white).opacity(0.5))
                    .foregroundColor(.black)
                    .offset(y: CGFloat(moneyDropping))
                    .animation(Animation.easeIn(duration: 1).delay(1).repeatForever(autoreverses: false))
                    .onAppear() {
                        moneyDropping = 300
                        rotateMoney = 360
                    }
            }
            
        }
        .ignoresSafeArea()
        .padding(50)
        .background(.teal)

    }
}

#Preview {
    SwiftUIView()
}
