//
//  ItemModels.swift
//  CatchMe
//
//  Created by Hassan Alkhafaji on 11/30/23.
//

import Foundation

struct GameModel {
    
    var score: Int = 0
    
    
    let emoji: [Item]
    
    
}



struct Item: Identifiable, Equatable, Hashable {
    var isTapped: Bool = false
    var id = UUID().uuidString
    var item: String
    
    
    
}
