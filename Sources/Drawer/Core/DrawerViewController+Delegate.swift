//
//  DrawerViewController+Delegate.swift
//  DrawerDemo
//
//  Created by Mihai Petrenco on 6/9/21.
//

import Foundation
import CoreGraphics

public protocol DrawerViewControllerDelegate: AnyObject {
    
    /**
     * A delegate method that, if implemented, will notify that the drawer offset has change during a pan gesture.
     */
    func drawerViewController(_ drawerViewController: DrawerViewController,
                              didChangeBottomOffsetTo bottomOffset: CGFloat)
    
    /**
     * A delegate method that, if implemented, will notify that the drawer position has changed.
     */
    func drawerViewController(_ drawerViewController: DrawerViewController,
                              didChangePosition position: DrawerPosition,
                              withBottomOffset bottomOffset: CGFloat)
}
