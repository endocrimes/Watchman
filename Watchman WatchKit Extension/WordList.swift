//
//  WordList.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import Foundation

class WordList {
    private let fileURL: String
    private var words: [String] = []
    
    init(fileURL: String) {
        self.fileURL = fileURL
    }
    
    func fetchRandomWord() -> String {
        let string = try! NSString(contentsOfFile: self.fileURL, encoding: NSUTF8StringEncoding)
        let components = string.componentsSeparatedByString("\n")
        let index = random() % components.count
        let word = components[index].lowercaseString
        
        return word
    }
}
