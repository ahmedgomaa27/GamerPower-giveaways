//
//  TextWithIcon.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 03/06/2024.
//

import SwiftUI

struct TextWithIcon: View {

    let iconName: String
    let text: String
    var showDivider = true
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 4) {
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Text(text)
                    .bold()
            }
            Spacer()
            
            if showDivider {
                Divider()
            }
        }
    }
}

#Preview {
    TextWithIcon(iconName: "heart", text: "Text")
}
