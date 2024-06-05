//
//  EpicGamesView.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 03/06/2024.
//

import SwiftUI

struct EpicGamesView: View {
    
    @StateObject var viewModel: GiveawayViewModel = GiveawayViewModel()
    
    var body: some View {
        
        if viewModel.showLoading {
            ProgressView("Loading...")
                .padding()
        }
        
        if let errorMessage = viewModel.errorMessage {
            Text("Error: \(errorMessage)")
                .padding()
        }
        
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                if !viewModel.giveaways.isEmpty {
                    LazyHStack(alignment: .center, spacing: 0) {
                        ForEach(viewModel.giveaways) { item in
                            NavigationLink {
                                GiveawayDetailsScreen(giveaway: item)
                            } label: {
                                getGiveawayCardView(item)
                            }
                        }
                    }
                    .onFirstAppear {
                        if viewModel.giveaways.count > 2 {
                            withAnimation {
                                proxy.scrollTo(viewModel.giveaways[1].id)
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, 40)
        }
        .onFirstAppear {
            refreshEpicGames()
        }
    }
    
    private func getGiveawayCardView(_ giveaway: GiveawayVM) -> some View {
        GiveawayCard(giveaway: giveaway)
            .id(giveaway.id)
            .frame(width: 300, height: 256)
            .scrollTransition { effect, phase in
                effect
//                    .rotationEffect(Angle(degrees: phase.isIdentity ? 0: 10))
                    .scaleEffect(phase.isIdentity ? 1: 0.8)
                    .contrast(phase.isIdentity ? 1: 0.5)
            }
    }
    
    private func refreshEpicGames() {
        Task {
            await viewModel.fetchGiveaways(parameters: ["platform":"epic-games-store"])
        }
    }
}

#Preview {
    EpicGamesView()
}
