//
//  UINavigation+Extensions.swift
//  Giveaways
//
//  Created by Ahmed Hamdy on 05/06/2024.
//

import UIKit.UINavigationController

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
