//
//  SecondViewController.swift
//  DrawerDemo
//
//  Created by Mihai Petrenco on 5/25/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.roundCorners([.topLeft, .topRight], radius: 20.0)
    }
    
}
