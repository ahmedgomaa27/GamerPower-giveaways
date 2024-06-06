//
//  ErrorTextView.swift
//  Giveaways
//
//  Created by Ahmed Hamdy on 05/06/2024.
//

import SwiftUI

struct ErrorTextView: View {

    let text: String

    var body: some View {
        Text(text)
            .padding()
    }
}

#Preview {
    ErrorTextView(text: "Error")
}
