//
//  FirstViewController.swift
//  DrawerDemo
//
//  Created by Mihai Petrenco on 5/25/21.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        return mapView
    }()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Layout setup
    
    private func setupLayout() {
        view.addSubview(mapView)
    }
    
}
