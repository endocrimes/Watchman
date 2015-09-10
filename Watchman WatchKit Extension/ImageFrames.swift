//
//  ImageFrames.swift
//  Watchman
//
//  Created by  Danielle Lancashireon 10/09/2015.
//  Copyright © 2015 Rocket Apps. All rights reserved.
//

import UIKit

enum ImageFrame : String {
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
}

func UIImageWithImageFrame(frame: ImageFrame) -> UIImage? {
    return UIImage(named: frame.rawValue)
}
