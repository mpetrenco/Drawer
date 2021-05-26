//
//  DrawerPosition.swift
//  DrawerViewController
//
//  Created by Mihai Petrenco on 5/23/21.
//

import CoreGraphics

public enum DrawerPosition {
    case partial
    case semi
    case full
}

class DrawerRatio {
    
    private static var partial: CGFloat = 0.2
    private static var semi: CGFloat = 0.5
    private static var full: CGFloat = 0.9
    
    static func ratio(for position: DrawerPosition) -> CGFloat {
        switch position {
        case .partial:
            return 1 - partial
        case .semi:
            return 1 - semi
        case .full:
            return 1 - full
        }
    }
    
    static func setRatio(_ ratio: CGFloat, for position: DrawerPosition) {
        switch position {
        case .partial:
            partial = ratio
        case .semi:
            semi = ratio
        case .full:
            full = ratio
        }
    }
}
