//
//  OnFirstAppearModifier.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 04/06/2024.
//

import SwiftUI

struct OnFirstAppearModifier: ViewModifier {
    
    let firstAction: () -> Void
    @State private var firstTime: Bool = true
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if firstTime {
                    firstTime = false
                    firstAction()
                }
            }
    }
}

extension View {

    func onFirstAppear(_ firstAction: @escaping () -> Void) -> some View {
        self.modifier(OnFirstAppearModifier(firstAction: firstAction))
    }
}
