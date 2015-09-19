//
//  CharacterPickerInterfaceController.swift
//  Watchman
//
//  Created by Danielle Lancashire on 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import WatchKit
import Foundation

class CharacterPickerInterfaceController: WKInterfaceController {
    var currentIndex = 0
    var contextObject: ContextObject?
    @IBOutlet weak var pickerView: WKInterfacePicker?
    
    
    @IBAction func select() {
        precondition(contextObject?.input?.count > currentIndex, "Value should be within the bounds of data")
        let selected = contextObject?.input?[currentIndex]
        contextObject?.output = selected
        popController()
    }
    
    @IBAction func didPickCharacter(value: Int) {
        currentIndex = value
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let contextObject = context as? ContextObject,
                  characters = contextObject.input
            else {
            popController()
            return
        }
        
        self.contextObject = contextObject
        
        let items = characters.map { character -> WKPickerItem in
            let item = WKPickerItem()
            item.title = String(character)
            
            return item
        }
        
        pickerView?.setItems(items)
    }
}
