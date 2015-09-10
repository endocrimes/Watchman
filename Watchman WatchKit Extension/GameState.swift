//
//  Game.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import Foundation

struct GameState {
    let answer: String
    var guessedCharacters: Set<Character> = Set()
    var frame: ImageFrame = .Frame0
    
    init(answer: String) {
        self.answer = answer
    }
    
    mutating func guess(character: Character) -> Bool {
        guessedCharacters.insert(character)
        
        let result = answer.characters.contains(character)
        
        if !result {
            frame = frame.nextFrame()
        }
        
        return result
    }
    
    func displayString() -> String {
        var string = ""
        for character in answer.characters {
            if string.characters.count > 0 {
                string += " "
            }
            
            if guessedCharacters.contains(character) {
                string.append(character)
            }
            else {
                string += "_"
            }
        }
        
        return string
    }
}