//
//  Game.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import Foundation

public struct GameState {
    public let answer: String
    public var guessedCharacters: Set<Character> = Set()
    public var frame: ImageFrame = .Frame0
    
    public init(answer: String) {
        self.answer = answer
    }
}