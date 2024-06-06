//
//  GiveawayCard.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 03/06/2024.
//

import SwiftUI

struct GiveawayCard: View {

    @Bindable var giveaway: GiveawayVM
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: giveaway.thumbnail)) { image in
                image
                    .resizable()
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(giveaway.title)
                        .font(.title)
                        .bold()
                    Spacer()
                    Button {
                        giveaway.isFavorite.toggle()
                    } label: {
                        Image(systemName: giveaway.isFavorite ? "heart.fill": "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }

                }
                
                Text(giveaway.platforms)
                    .font(.subheadline)
                Spacer()
                
                Text(giveaway.description)
                    .font(.caption)
            }
            .padding()
            .foregroundStyle(Color.white)
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
        }
    }
}
