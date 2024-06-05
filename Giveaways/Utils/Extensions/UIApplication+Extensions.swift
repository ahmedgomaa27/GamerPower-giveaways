//
//  UIApplication+Extensions.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 05/06/2024.
//

import UIKit.UIApplication

extension UIApplication {

    var statusBarHeight: CGFloat {
        let currentWindow = UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).last
        return currentWindow?.statusBarManager?.statusBarFrame.height ?? 44
    }
}
