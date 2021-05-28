
<p align="center">
<img src="https://i.postimg.cc/8k6jWhnp/logo.png" alt="Logo" width="200px">

A simple implementation of an expandable bottom drawer view.
</p>

## Instalation

- Use Swift Package Manager to install the dependency.

## Usage

1. Import the module

```swift
import Drawer
```

2. Define your root and draggable view controllers

```swift
let rootViewController = UIViewController()
let draggableViewController = UIViewController()
```

3. Initialize the DrawerViewController

```swift
let drawerViewController = DrawerViewController(parentController: rootViewController, draggableController: draggableViewController)
```

4. Present it as usual

```swift
present(drawerViewController, animated: true)
```

## Features:

Programmatically change drawer position.  
> Pick between: `.partial`, `.semi`, `.full`

```swift
drawerViewController.position = .partial
```

Toggle user drag gestures

```swift
drawerViewController.isDraggable = true
```

Toggle drawer display

```swift
drawerViewController.isHidden = false
```

## Customization:


Override height ratio for each position.  
> Values should range between `0` and `1`, where `1` is the full height of the screen.

```swift
drawerViewController.setHeightRatio(0.3, for: .partial)
```

Override height for each position.  

```swift
drawerViewController.setHeight(400, for: .semi)
```

> **Note:**  
> You can easily combine height and ratio customizations.

```swift
drawerViewController.setHeightRatio(0.3, for: .partial)
drawerViewController.setHeight(400, for: .semi)
drawerViewController.setHeightRatio(0.8, for: .full)
```