//
//  GiveawayDetailsScreen.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 03/06/2024.
//

import SwiftUI

struct GiveawayDetailsScreen: View {
    
    @Bindable var giveaway: GiveawayVM
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack {
                    AsyncImage(url: URL(string: giveaway.thumbnail)) { image in
                        image
                            .resizable()
                            .frame(height: 264)
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Button(action: {
                                dismiss()
                            }, label: {
                                Image(systemName: "chevron.left.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            })
                            .foregroundStyle(Color.white)
                            
                            Spacer()
                            
                            Button {
                                giveaway.isFavorite.toggle()
                            } label: {
                                Image(systemName: giveaway.isFavorite ? "heart.fill": "heart")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .foregroundStyle(Color.white)
                            
                        }
                        .safeAreaPadding(.top, UIApplication.shared.statusBarHeight)
                        
                        Spacer()
                        HStack(alignment: .bottom, spacing: 0) {
                            Text(giveaway.title)
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color.white)
                            Spacer()
                            Button {
                                if let url = URL(string: giveaway.giveawayUrl) {
                                    openURL(url)
                                }
                            } label: {
                                Text("Get it")
                                    .font(.caption)
                                    .bold()
                                    .padding(6)
                                    .background(Color.white)
                                    .foregroundStyle(Color.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                            }
                            
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.7))
                }

                HStack(spacing: 8) {
                    TextWithIcon(iconName: "dollarsign.square.fill", text: giveaway.price)
                    TextWithIcon(iconName: "person.2.fill", text: giveaway.users)
                    TextWithIcon(iconName: "gamecontroller.fill", text: giveaway.type)
                }

                VStack(alignment: .leading, spacing: 16) {
                    TextWithTitle(title: "Platforms", text: giveaway.platforms)
                    TextWithTitle(title: "Giveaway End date", text: giveaway.endDate)
                    TextWithTitle(title: "Description", text: giveaway.description)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(edges: .top)
    }
}

//#Preview {
//    GiveawayDetailsScreen()
//}
