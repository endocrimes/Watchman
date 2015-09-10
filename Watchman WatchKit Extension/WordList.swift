//
//  WordList.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import Foundation

class WordList {
    private let fileURL: NSURL
    private var words: [String] = []
    
    init(fileURL: NSURL) {
        self.fileURL = fileURL
    }
    
    func fetchRandomWord(completion: (String) -> ()) {
        dispatch_async(dispatch_get_main_queue()) {
            completion("Foundation")
        }
    }
}
