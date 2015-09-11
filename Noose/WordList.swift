//
//  WordList.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import Foundation

public protocol WordListProtocol {
    func fetchRandomWord() -> String
}

public class WordList: WordListProtocol {
    private let fileURL: String
    private var words: [String] = []
    
    public init(fileURL: String) {
        self.fileURL = fileURL
    }
    
    public func fetchRandomWord() -> String {
        /**
        Loading an entire wordlist into memory is kinda a terrible idea.
        */
        let string = try! NSString(contentsOfFile: self.fileURL, encoding: NSUTF8StringEncoding)
        let components = string.componentsSeparatedByString("\n")
        let index = Int(arc4random_uniform(UInt32(components.count)))
        let word = components[index].lowercaseString
        print(word)
        
        return word
    }
}
