//
//  ChoosePlatformView.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 04/06/2024.
//

import SwiftUI

struct ChoosePlatformView: View {

    @State var selectedPlatform: Constants.Platfroms = .all
    var platformClicked: (Constants.Platfroms) -> ()

    var body: some View {
        HStack {
            ForEach(Constants.Platfroms.allCases, id: \.self) { item in
                Button(action: {
                    selectedPlatform = item
                    platformClicked(item)
                }, label: {
                    Text(item.rawValue)
                        .foregroundStyle(item == selectedPlatform ? Color.black: Color.gray)
                })
            }
            Spacer()
        }
    }
}

