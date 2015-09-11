//
//  GameController.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 11/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import Foundation

public class GameController {
    private let wordList: WordListProtocol
    private var gameState: GameState!
    
    public var displayString: String {
        var string = ""
        for character in gameState.answer.characters {
            if string.characters.count > 0 {
                string += " "
            }
            
            if gameState.guessedCharacters.contains(character) {
                string.append(character)
            }
            else {
                string += "_"
            }
        }
        
        return string
    }
    
    /**
     Create a new instance of GameController with a word list to select from.
     */
    public init(wordList: WordListProtocol) {
        self.wordList = wordList
        let firstWord = wordList.fetchRandomWord()
        
        self.gameState = GameState(answer: firstWord)
    }
    
    /**
     Submit a guess to the game, will return true if the character is contained
     in the word.
     */
    public func guess(character: Character) -> Bool {
        gameState.guessedCharacters.insert(character)
        
        let result = gameState.answer.characters.contains(character)
        
        if !result {
            gameState.frame = gameState.frame.nextFrame()
        }
        
        return result
    }   
}