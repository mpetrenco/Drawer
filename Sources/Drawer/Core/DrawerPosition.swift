//
//  DrawerPosition.swift
//  DrawerViewController
//
//  Created by Mihai Petrenco on 5/23/21.
//

import CoreGraphics

public enum DrawerPosition {
    case hidden
    case partial
    case semi
    case full
    
    var offset: CGFloat {
        switch self {
        case .hidden:
            return Constants.Drawer.hiddenBottomOffset
        case .partial:
            return Constants.Drawer.partialBottomOffset
        case .semi:
            return Constants.Drawer.semiBottomOffset
        case .full:
            return Constants.Drawer.fullBottomOffset
        }
    }
}
