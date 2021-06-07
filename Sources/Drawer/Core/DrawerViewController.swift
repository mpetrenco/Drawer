//
//  DrawerViewController.swift
//  DrawerViewController
//
//  Created by Mihai Petrenco on 5/21/21.
//

import UIKit

public class DrawerViewController: UIViewController {
    
    // MARK: - Public properties
    
    /**
     * Change the drawer's position, from:  `.hidden`, `.partial`, `.semi` and `.full`.
     * Default position: `.partial`
     */
    public var position: DrawerPosition = .partial {
        didSet {
            let newValue = DrawerHeight.height(for: position)
            changeBottomAnchorConstraint(to: newValue)
            changeBackgroundTransparency(for: position)
        }
    }
    
    /**
     * Speficies if the drawer element can be dragged via a pan gesture.
     * Default value: `true`
     */
    public var isDraggable = true
    
    /**
     * Specifies if the drawer element can be dismissed by a drag gesture.
     * Default value: `false`
     */
    public var isDismissable = false
        
    /**
     * A reference to the bottom anchor, responsible for the sliding offset.
     * Override if you want custom control of the drawer.
     */
    public var bottomAnchorConstraint: NSLayoutConstraint!
    
    // MARK: - Private properties
    
    private var parentController: UIViewController
    private var draggableController: UIViewController
    private var startingBottomConstant: CGFloat = 0.0
    
    private lazy var backgroundView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .black
        view.alpha = 0.0
        return view
    }()
    
    // MARK: - Initializers
    
    public init(parentController: UIViewController,
                draggableController: UIViewController) {
        
        self.parentController = parentController
        self.draggableController = draggableController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Coder initialization not supported.")
    }
    
    // MARK: - Public methods
    
    public func setHeightRatio(_ heightRatio: CGFloat, for position: DrawerPosition) {
        DrawerHeight.setHeight(Constants.Screen.height * heightRatio, for: position)
    }
    
    public func setHeight(_ height: CGFloat, for position: DrawerPosition) {
        DrawerHeight.setHeight(height, for: position)
    }
    
    // MARK: - View lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupConstraints()
        setupGestures()
        setupBackgroundView()
    }
    
    // MARK: - Layout setup
    
    private func setupControllers() {
        add(parentController)
        add(draggableController)
    }
    
    private func setupBackgroundView() {
        view.insertSubview(backgroundView, aboveSubview: parentController.view)
    }
    
    private func setupConstraints() {
        
        let bottomOffset = DrawerHeight.height(for: position)
        
        draggableController.view.translatesAutoresizingMaskIntoConstraints = false
        bottomAnchorConstraint = draggableController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                                                  constant: bottomOffset)
        
        NSLayoutConstraint.activate([
            draggableController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            draggableController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            draggableController.view.heightAnchor.constraint(equalToConstant: Constants.Screen.height),
            bottomAnchorConstraint
        ])
    }
    
    private func setupGestures() {
        let panGesture = UIPanGestureRecognizer(target: self,
                                                action: #selector(handlePanGesture))
        draggableController.view.addGestureRecognizer(panGesture)
    }
    
    // MARK: - Gesture handlers
    
    @objc private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        
        guard isDraggable else { return }
        
        let offset = sender.translation(in: view).y
        
        switch sender.state {
        case .began:
            startingBottomConstant = bottomAnchorConstraint.constant
        case .changed:
            if startingBottomConstant + offset > 0 {
                backgroundView.alpha = alpha(for: offset)
                bottomAnchorConstraint.constant = startingBottomConstant + offset
            }
        case .ended:
            changePosition(isExpanding: offset < 0)
            
        default:
            break
        }
    }
    
    // MARK: - Helper methods
    
    private func changePosition(isExpanding: Bool) {
        
        if position == .full {
            position = isExpanding ? .full : .semi
            return
        }
        
        if position == .semi {
            position = isExpanding ? .full : .partial
            return
        }
        
        if (position == .partial) {
            let nextPosition: DrawerPosition = isDismissable ? .hidden : .partial
            position = isExpanding ? .semi : nextPosition
            return
        }
    }
    
    private func changeBackgroundTransparency(for position: DrawerPosition) {
        if position == .partial || position == .hidden {
            backgroundView.isUserInteractionEnabled = false
        } else {
            backgroundView.isUserInteractionEnabled = true
        }
        
        UIView.animate(withDuration: 0.3) { [unowned self] in
            let offset = DrawerHeight.height(for: position)
            backgroundView.alpha = alpha(for: offset)
        }
    }
    
    private func changeBottomAnchorConstraint(to constant: CGFloat) {
        if bottomAnchorConstraint == nil { return }
        
        bottomAnchorConstraint.constant = constant
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut) { [unowned self] in
            view.layoutSubviews()
        }
    }
    
    private func alpha(for offset: CGFloat) -> CGFloat {
        guard bottomAnchorConstraint != nil else { return 0.0 }
        return min(1 - bottomAnchorConstraint.constant / UIScreen.main.bounds.height, 0.80)
    }
    
}

