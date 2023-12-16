//
//  ItemViewModel.swift
//  CatchMe
//
//  Created by Hassan Alkhafaji on 11/30/23.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published  var gameStarted = false
    @Published var model: GameModel = GameModel(emoji: [Item(item: "🎃"), Item(item: "🚓"), Item(item: "👺"), Item(item: "👻"), Item(item: "🏎️")])
    
    init() {
        
    }
    

}
