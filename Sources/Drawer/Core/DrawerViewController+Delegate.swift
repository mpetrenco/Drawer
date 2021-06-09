//
//  DrawerViewController+Delegate.swift
//  DrawerDemo
//
//  Created by Mihai Petrenco on 6/9/21.
//

import Foundation
import CoreGraphics

public protocol DrawerViewControllerDelegate: AnyObject {
    
    func drawerViewController(_ drawerViewController: DrawerViewController,
                              didChangeBottomOffsetTo bottomOffset: CGFloat)
    
}
