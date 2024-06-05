//
//  LoaderView.swift
//  Giveaways
//
//  Created by Ahmed Hamdy on 05/06/2024.
//

import SwiftUI

struct LoaderView: View {

    var body: some View {
        ProgressView("Loading...")
            .padding()
    }
}

#Preview {
    LoaderView()
}
