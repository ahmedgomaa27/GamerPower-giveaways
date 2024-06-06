//
//  TextWithTitle.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 03/06/2024.
//

import SwiftUI

struct TextWithTitle: View {

    let title: String
    let text: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .bold()
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    TextWithTitle(title: "Title", text: "Text")
}
