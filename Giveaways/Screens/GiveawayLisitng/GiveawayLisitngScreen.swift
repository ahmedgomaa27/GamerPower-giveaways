//
//  GiveawayLisitngScreen.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 02/06/2024.
//

import SwiftUI

struct GiveawayLisitngScreen: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                    getTitleView()
                    EpicGamesView()
                    GiveawayListingView()
            }
        }
    }
    
    
    func getTitleView() -> some View {
        HStack(alignment: .center) {
            Text("Explore Games Giveaways")
                .font(.largeTitle)

            Spacer()
            Text("👋")
        }
        .bold()
        .padding()
    }
}


#Preview {
    GiveawayLisitngScreen()
}
