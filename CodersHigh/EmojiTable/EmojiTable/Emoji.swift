//
//  Emoji.swift
//  EmojiTable
//
//  Created by 강민규 on 2022/02/16.
//

import Foundation

struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
}
