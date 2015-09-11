//
//  WordList.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import Foundation

/**
    Loading an entire wordlist into memory is kinda a terrible idea.
*/

public class WordList {
    private let fileURL: String
    private var words: [String] = []
    
    public init(fileURL: String) {
        self.fileURL = fileURL
    }
    
    public func fetchRandomWord() -> String {
        let string = try! NSString(contentsOfFile: self.fileURL, encoding: NSUTF8StringEncoding)
        let components = string.componentsSeparatedByString("\n")
        let index = random() % components.count
        let word = components[index].lowercaseString
        print(word)
        
        return word
    }
}
