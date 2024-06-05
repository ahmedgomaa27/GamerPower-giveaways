//
//  GiveawayListingView.swift
//  giveaways
//
//  Created by Ahmed Hamdy on 04/06/2024.
//

import SwiftUI

struct GiveawayListingView: View {
    
    @StateObject var viewModel: GiveawayViewModel = GiveawayViewModel()
    
    var body: some View {
        VStack {
            ChoosePlatformView { platform in
                refreshProducts(platform: platform)
            }

            if viewModel.showLoading {
                ProgressView("Loading...")
                    .padding()
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .padding()
            }
            
            if !viewModel.giveaways.isEmpty {
                LazyVStack {
                    ForEach(viewModel.giveaways) { giveaway in
                        NavigationLink {
                            GiveawayDetailsScreen(giveaway: giveaway)
                        } label: {
                            GiveawayCard(giveaway: giveaway)
                                .frame(height: 480)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .onFirstAppear {
            refreshProducts(platform: .all)
        }
    }
    
    func refreshProducts(platform: Constants.Platfroms) {
        Task {
            await viewModel.fetchGiveaways(selectedPlatform: platform)
        }
    }
}

#Preview {
    GiveawayListingView()
}
