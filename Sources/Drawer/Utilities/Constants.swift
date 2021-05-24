//
//  Constants.swift
//  DrawerViewController
//
//  Created by Mihai Petrenco on 5/23/21.
//

import UIKit

struct Constants {
    
    struct Screen {
        static let width: CGFloat = UIScreen.main.bounds.width
        static let height: CGFloat = UIScreen.main.bounds.height
    }
    
    struct Drawer {
        static let topPadding: CGFloat = 116.0
        static let height: CGFloat = Constants.Screen.height - topPadding
        static let hiddenBottomOffset: CGFloat = Constants.Screen.height - topPadding
        static let partialBottomOffset: CGFloat = hiddenBottomOffset - 209.0
        static let semiBottomOffset: CGFloat = hiddenBottomOffset - 443.0
        static let fullBottomOffset: CGFloat = 0
    }
}
