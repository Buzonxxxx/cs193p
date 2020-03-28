//
//  Card.swift
//  Concentration
//
//  Created by Louis Liao on 2020/3/22.
//  Copyright © 2020 Louis Liao. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var indentifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.indentifier = Card.getUniqueIdentifier()
    }
}
