//
//  CharacterPickerInterfaceController.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import WatchKit
import Foundation


class CharacterPickerInterfaceController: WKInterfaceController {
    var data: [Character] = []
    var currentIndex = 0
    var contextObject: ContextObject?
    @IBOutlet weak var pickerView: WKInterfacePicker?
    
    
    @IBAction func select() {
        precondition(data.count > currentIndex, "Value should be within the bounds of data")
        let selected = data[currentIndex]
        contextObject?.output = selected
        popController()
    }
    
    @IBAction func didPickCharacter(value: Int) {
        currentIndex = value
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let contextObject = context as? ContextObject,
                  usedChars = contextObject.input
            else {
            popController()
            return
        }
        
        self.contextObject = contextObject
        
        let used = usedChars.characters
        let alphabet = "abcdefghijklmnopqrstuvwxyz".characters
        
        let notUsed: Character -> Bool = { char in
            return !used.contains(char)
        }
        
        let usableCharacters = alphabet.filter(notUsed)
        
        data = usableCharacters
        
        let items = usableCharacters.map { character -> WKPickerItem in
            let item = WKPickerItem()
            item.title = String(character)
            
            return item
        }
        
        pickerView?.setItems(items)
    }
}
