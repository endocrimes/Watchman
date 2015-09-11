//
//  InterfaceController.swift
//  Watchman WatchKit Extension
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import WatchKit
import Foundation
import Noose

class ContextObject {
    var input: [Character]?
    var output: Character?
}

class InterfaceController: WKInterfaceController {
    var contextObject: ContextObject?
    lazy var gameController: GameController = {
        let list = WordList(fileURL: NSBundle.mainBundle().pathForResource("words", ofType: "txt")!)
        
        return GameController(wordList: list)
    }()
    
    @IBOutlet var hangmanImageView: WKInterfaceImage!
    @IBOutlet var guessLabel: WKInterfaceLabel!
    
    @IBAction func resetGameButtonTapped() {
        gameController.newGame()
        updateUI()
    }
    
    @IBAction func pickCharacterButtonTapped() {
        if gameController.stage != .InProgress {
            WKInterfaceDevice().playHaptic(.Failure)
            return
        }
        
        let selectableCharacters = Array(gameController.validCharacters)
        
        contextObject = ContextObject()
        contextObject?.input = selectableCharacters
        
        pushControllerWithName("CharacterPicker", context: contextObject)
    }
    
    override func didAppear() {
        super.didAppear()
        
        if let output = self.contextObject?.output {
            if gameController.guess(output) {
                WKInterfaceDevice().playHaptic(.Success)
            }
            else {
                WKInterfaceDevice().playHaptic(.Failure)
            }
            
            contextObject = nil
        }
        
        updateUI()
    }
    
    func updateUI() {
        switch gameController.stage {
        case .InProgress:
            guessLabel.setTextColor(.whiteColor())
            guessLabel.setText(gameController.displayString)
            hangmanImageView.setImageNamed(gameController.watchmanFrame.rawValue)
        case .Won:
            guessLabel.setTextColor(.greenColor())
            guessLabel.setText(gameController.displayString)
        case .Lost:
            guessLabel.setTextColor(.redColor())
            guessLabel.setText(gameController.displayString)
        }
    }
}
