//
//  DrawerHeight.swift
//  DrawerViewController
//
//  Created by Mihai Petrenco on 5/23/21.
//

import CoreGraphics

public enum DrawerPosition {
    case partial
    case semi
    case full
    case hidden
}

class DrawerHeight {
    private static var hidden: CGFloat = Constants.Screen.height
    private static var partial: CGFloat = Constants.Screen.height * 3 / 4
    private static var semi: CGFloat = Constants.Screen.height / 2
    private static var full: CGFloat = Constants.Screen.height * 1 / 10
    
    static func height(for position: DrawerPosition) -> CGFloat {
        switch position {
        case .hidden:
            return hidden
        case .partial:
            return partial
        case .semi:
            return semi
        case .full:
            return full
        }
    }
    
    static func setHeight(_ height: CGFloat, for position: DrawerPosition) {
        switch position {
        case .partial:
            partial = Constants.Screen.height - height
        case .semi:
            semi = Constants.Screen.height - height
        case .full:
            full = Constants.Screen.height - height
        case .hidden:
            break
        }
    }
}
