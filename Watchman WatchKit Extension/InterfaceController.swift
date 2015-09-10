//
//  InterfaceController.swift
//  Watchman WatchKit Extension
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import WatchKit
import Foundation

class ContextObject {
    var input: String?
    var output: Character?
}

class InterfaceController: WKInterfaceController {
    var contextObject: ContextObject?
    var gameState = GameState(answer: "interface")
    
    @IBOutlet var hangmanImageView: WKInterfaceImage!
    @IBOutlet var guessLabel: WKInterfaceLabel!
    
    @IBAction func resetGameButtonTapped() {
        gameState = GameState(answer: "iosdevuk")
    }
    
    @IBAction func pickCharacterButtonTapped() {
        if gameState.frame == .Frame11 {
            WKInterfaceDevice().playHaptic(.Failure)
            
            return
        }
        
        let string = String(Array(gameState.guessedCharacters))
        
        contextObject = ContextObject()
        contextObject?.input = string
        
        pushControllerWithName("CharacterPicker", context: contextObject)
    }
    
    override func didAppear() {
        super.didAppear()
        
        if let output = self.contextObject?.output {
            if gameState.guess(output) {
                WKInterfaceDevice().playHaptic(.Success)
            }
            else {
                WKInterfaceDevice().playHaptic(.Failure)
            }
        }
        
        updateUI()
        
        contextObject = nil
    }
    
    func updateUI() {
        guessLabel.setText(gameState.displayString())
        if gameState.frame == .None {
            hangmanImageView.setImage(nil)
        }
        else {
            animateWithDuration(0.2) {
                self.hangmanImageView.setImageNamed(self.gameState.frame.rawValue)
            }
        }
    }
}
