//
//  ImageFrames.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import UIKit

public enum ImageFrame : String {
    case Frame0 = "Frame 0"
    case Frame1 = "Frame 1"
    case Frame2 = "Frame 2"
    case Frame3 = "Frame 3"
    case Frame4 = "Frame 4"
    case Frame5 = "Frame 5"
    case Frame6 = "Frame 6"
    case Frame7 = "Frame 7"
    case Frame8 = "Frame 8"
    case Frame9 = "Frame 9"
    case Frame10 = "Frame 10"
    case Frame11 = "Frame 11"
    
    public func nextFrame() -> ImageFrame {
        var frame: ImageFrame!
        switch self {
        case .Frame0:
            frame = .Frame1
        case .Frame1:
            frame = .Frame2
        case .Frame2:
            frame = .Frame3
        case .Frame3:
            frame = .Frame4
        case .Frame4:
            frame = .Frame5
        case .Frame5:
            frame = .Frame6
        case .Frame6:
            frame = .Frame7
        case .Frame7:
            frame = .Frame8
        case .Frame8:
            frame = .Frame9
        case .Frame9:
            frame = .Frame10
        case .Frame10:
            frame = .Frame11
        case .Frame11:
            frame = .Frame11
        }
        
        return frame
    }
}
